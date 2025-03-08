import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/scoresheet/scoresheet.dart';
import '../../../util/theme/colors.dart';
import '../scoresheet_viewmodel.dart';
import 'empty_score_icon.dart';
import 'score_icon.dart';

class ScoreKeyboard extends StatelessWidget {
  const ScoreKeyboard({super.key, required this.endIndex});

  final int endIndex;

  @override
  Widget build(BuildContext context) {
    final Scoresheet scoresheet = Provider.of<ScoresheetViewModel>(
      context,
    ).getScoresheet(
      Provider.of<ScoresheetViewModel>(context, listen: false).scoresheetIndex,
    );
    final ThemeColors themeColors = Theme.of(context).extension<ThemeColors>()!;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List<Widget>.generate(scoresheet.shotsPerEnd, (
              int shotIndex,
            ) {
              if (scoresheet.scoreData.length <= endIndex ||
                  scoresheet.scoreData[endIndex].length <= shotIndex) {
                return const EmptyScoreIcon();
              } else {
                return ScoreIcon(
                  value:
                      scoresheet.target.formattedScores[scoresheet
                          .scoreData[endIndex][shotIndex]],
                  color:
                      themeColors.colors![scoresheet.target.colors[scoresheet
                          .scoreData[endIndex][shotIndex]]],
                );
              }
            }),
          ),
          const Padding(padding: EdgeInsets.all(8.0), child: Divider()),
          Expanded(
            child: GridView(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 190.0,
                mainAxisExtent: 54.0,
                mainAxisSpacing: 4.0,
                crossAxisSpacing: 4.0,
              ),
              children:
                  List<Widget>.generate(
                    scoresheet.target.formattedScores.length,
                    (int index) => InkWell(
                      onTap:
                          () => Provider.of<ScoresheetViewModel>(
                            context,
                            listen: false,
                          ).addScore(endIndex, index),
                      child: ScoreIcon(
                        value: scoresheet.target.formattedScores[index],
                        color:
                            themeColors.colors![scoresheet
                                .target
                                .colors[index]],
                      ),
                    ),
                  ) +
                  <Widget>[
                    InkWell(
                      onTap:
                          () => Provider.of<ScoresheetViewModel>(
                            context,
                            listen: false,
                          ).deleteScore(endIndex),
                      child: const ScoreIcon(
                        value: 'Delete',
                        color: Colors.black12,
                      ),
                    ),
                  ],
            ),
          ),
        ],
      ),
    );
  }
}
