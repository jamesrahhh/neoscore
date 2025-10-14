import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/scoresheet/scoresheet.dart';
import '../../../util/theme/colors.dart';
import '../../widgets/empty_score_icon.dart';
import '../../widgets/score_icon.dart';
import '../editor_viewmodel.dart';
import 'editor_row.dart';

class EditorKeyboard extends ConsumerWidget {
  const EditorKeyboard({required this.scoresheet, required this.endIndex, super.key});

  final Scoresheet scoresheet;
  final int endIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeColors themeColors = Theme.of(context).extension<ThemeColors>()!;
    final EditorViewModel editorViewModel =
        ref.read(editorViewModelProvider(scoresheet: scoresheet).notifier);

    return SizedBox(
      height: ((scoresheet.target.formattedScores.length + 1) / 3.0).ceil() * 62 + 120,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
            child: EditorRow(scoresheet: scoresheet, endIndex: endIndex),
          ),
          const Padding(padding: EdgeInsets.all(8), child: Divider()),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: GridView(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 190,
                  mainAxisExtent: 54,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 6,
                ),
                children: List<Widget>.generate(
                      scoresheet.target.formattedScores.length,
                      (int index) => InkWell(
                        onTap: () => editorViewModel.addScore(
                          endIndex: endIndex,
                          score: scoresheet.target.formattedScores.length - index - 1,
                        ),
                        child: ScoreIcon(
                          value: scoresheet.target.formattedScores[
                              scoresheet.target.formattedScores.length - index - 1],
                          colors: themeColors.colors![scoresheet
                              .target.colors[scoresheet.target.formattedScores.length - index - 1]],
                        ),
                      ),
                    ) +
                    <Widget>[
                      InkWell(
                        onTap: () => editorViewModel.deleteScore(endIndex: endIndex),
                        child: const EmptyScoreIcon(child: Icon(Icons.delete)),
                      ),
                    ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<Scoresheet>('scoresheet', scoresheet))
      ..add(DiagnosticsProperty<int>('endIndex', endIndex));
  }
}
