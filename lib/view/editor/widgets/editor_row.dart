import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common/scoresheet/scoresheet.dart';
import '../../../util/theme/colors.dart';
import '../../widgets/empty_score_icon.dart';
import '../../widgets/score_icon.dart';
import '../editor_viewmodel.dart';

class EditorRow extends ConsumerWidget {
  const EditorRow({required this.scoresheet, required this.endIndex, super.key});

  final Scoresheet scoresheet;
  final int endIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeColors themeColors = Theme.of(context).extension<ThemeColors>()!;
    final List<int> end = ref.watch(editorEndProvider(scoresheet: scoresheet, endIndex: endIndex));
    final int highestScoreCount = ref.watch(
      singleScoreEndProvider(
        scoresheet: scoresheet,
        score: scoresheet.target.formattedScores.length - 1,
        endIndex: endIndex,
      ),
    );
    final int totalScore =
        ref.watch(totalScoreEndProvider(scoresheet: scoresheet, endIndex: endIndex));

    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 2),
          child: Align(
            alignment: Alignment.topLeft,
            child: endIndex == 0
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'end ${endIndex + 1}',
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      Row(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "${scoresheet.target.formattedScores.last.toLowerCase()}'s",
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                          ),
                          SizedBox(
                            width: 34,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                'total',
                                style: Theme.of(context).textTheme.displaySmall,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                : Text(
                    '${endIndex + 1}',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List<Widget>.generate(
                  scoresheet.shotsPerEnd,
                  (int shotIndex) {
                    if (end.length <= shotIndex) {
                      return const EmptyScoreIcon();
                    } else {
                      return ScoreIcon(
                        value: scoresheet.target.formattedScores[end[shotIndex]],
                        colors: themeColors.colors![scoresheet.target.colors[end[shotIndex]]],
                      );
                    }
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  '$highestScoreCount',
                ),
              ),
            ),
            SizedBox(
              width: 34,
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  '$totalScore',
                ),
              ),
            ),
          ],
        ),
      ],
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
