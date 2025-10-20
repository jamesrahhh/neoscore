import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:timeago/timeago.dart';

import '../../common/scoresheet/scoresheet.dart';
import '../browser/browser_viewmodel.dart';
import 'editor_viewmodel.dart';
import 'widgets/editor_keyboard.dart';
import 'widgets/editor_row.dart';

class EditorView extends HookConsumerWidget {
  const EditorView({required this.scoresheet, super.key});

  final Scoresheet scoresheet;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Scoresheet editorState = ref.watch(editorViewModelProvider(scoresheet: scoresheet));
    final double averageArrow = ref.watch(averageArrowProvider(scoresheet: scoresheet));
    final int highestScoreCount = ref.watch(
      singleScoreProvider(
        scoresheet: scoresheet,
        score: scoresheet.target.formattedScores.length - 1,
      ),
    );
    final int totalScore = ref.watch(totalScoreProvider(scoresheet: scoresheet));

    final ValueNotifier<DateTime?> lastSaved = useState<DateTime?>(null);
    final ObjectRef<bool> skipFirst = useRef<bool>(true);
    useEffect(
      () {
        if (skipFirst.value) {
          skipFirst.value = false;
          return null;
        }

        final Timer autosaveTimer = Timer(const Duration(seconds: 5), () {
          ref.read(browserViewModelProvider.notifier).updateScoresheet(scoresheet: editorState);
          lastSaved.value = DateTime.now();
        });

        return autosaveTimer.cancel;
      },
      <Scoresheet>[editorState],
    );

    final ValueNotifier<int> tick = useState(0);
    useEffect(
      () {
        if (lastSaved.value == null) {
          return null;
        }

        Timer? ticker;
        void scheduleNextTick() {
          final Duration timeElapsed =
              DateTime.now().difference(lastSaved.value ?? editorState.updatedAt);
          ticker?.cancel();
          ticker = Timer.periodic(
              timeElapsed.inHours < 1 ? const Duration(minutes: 1) : const Duration(hours: 1), (_) {
            tick.value++;
            scheduleNextTick();
          });
        }

        scheduleNextTick();
        return () => ticker?.cancel();
      },
      <DateTime?>[lastSaved.value],
    );

    return PopScope(
      onPopInvokedWithResult: (_, __) {
        if (Navigator.of(context).canPop()) {
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Scoresheet saved'),
              duration: Duration(seconds: 2),
            ),
          );
          ref.read(browserViewModelProvider.notifier).updateScoresheet(scoresheet: editorState);
        }
      },
      canPop: false,
      child: Scaffold(
        body: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: 100,
              centerTitle: true,
              title: Column(
                children: <Widget>[
                  Text(
                    editorState.name,
                  ),
                  Text(
                    'Average arrow: ${averageArrow.toStringAsPrecision(4)}',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  if (lastSaved.value != null)
                    Text(
                      'Autosaved ${format(lastSaved.value ?? editorState.updatedAt)}',
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                ],
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 8),
              sliver: SliverGrid.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 500,
                  mainAxisExtent: 66,
                  crossAxisSpacing: 4,
                ),
                itemCount: editorState.ends,
                itemBuilder: (BuildContext context, int endIndex) => InkWell(
                  onTap: () => showModalBottomSheet<void>(
                    context: context,
                    builder: (_) => EditorKeyboard(scoresheet: scoresheet, endIndex: endIndex),
                  ),
                  child: EditorRow(scoresheet: scoresheet, endIndex: endIndex),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      '$highestScoreCount',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: SizedBox(
                      height: 54,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text('$totalScore'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SliverPadding(padding: EdgeInsets.only(top: 20)),
          ],
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<Scoresheet>('scoresheet', scoresheet));
  }
}
