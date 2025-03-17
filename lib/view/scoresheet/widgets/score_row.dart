import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/scoresheet/scoresheet.dart';
import '../../../util/theme/colors.dart';
import '../scoresheet_model.dart';
import 'empty_score_icon.dart';
import 'score_icon.dart';

class ScoreRow extends StatelessWidget {
  const ScoreRow({
    super.key,
    required this.scoresheetIndex,
    required this.endIndex,
  });

  final int scoresheetIndex;
  final int endIndex;

  @override
  Widget build(BuildContext context) {
    final ThemeColors themeColors = Theme.of(context).extension<ThemeColors>()!;
    final Scoresheet scoresheet = Provider.of<ScoresheetModel>(
      context,
      listen: false,
    ).getScoresheet(scoresheetIndex);

    return Selector<ScoresheetModel, List<int>>(
      selector:
          (_, ScoresheetModel scoresheetModel) =>
              scoresheetModel
                  .getScoresheet(scoresheetIndex)
                  .scoreData[endIndex],
      builder: (_, List<int> end, __) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 8.0),
              child: SizedBox(width: 24, child: Text('${endIndex + 1}')),
            ),
            Expanded(
              child: Selector<ScoresheetModel, List<int>>(
                selector:
                    (_, ScoresheetModel scoresheetModel) =>
                        scoresheetModel
                            .getScoresheet(scoresheetIndex)
                            .scoreData[endIndex],
                builder:
                    (_, List<int> end, __) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List<Widget>.generate(scoresheet.shotsPerEnd, (
                        int shotIndex,
                      ) {
                        if (scoresheet.scoreData.length <= endIndex ||
                            end.length <= shotIndex) {
                          return const EmptyScoreIcon();
                        } else {
                          return ScoreIcon(
                            value:
                                scoresheet
                                    .target
                                    .formattedScores[end[shotIndex]],
                            color:
                                themeColors.colors![scoresheet
                                    .target
                                    .colors[end[shotIndex]]],
                          );
                        }
                      }),
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 14.0),
              child: SizedBox(
                width: 8,
                child: Text(
                  '${scoresheet.getSingleScoreEnd(endIndex, scoresheet.target.formattedScores.length - 1)}',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 14.0, right: 24.0),
              child: SizedBox(
                width: 24,
                child: Text('${scoresheet.getTotalScoreEnd(endIndex)}'),
              ),
            ),
          ],
        );
      },
    );
  }
}
