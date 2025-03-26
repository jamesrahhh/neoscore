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

    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 2),
          child: Align(
            alignment: Alignment.topLeft,
            child:
                endIndex == 0
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
                                "${Provider.of<ScoresheetModel>(context, listen: false).getScoresheet(scoresheetIndex).target.formattedScores.last.toLowerCase()}'s",
                                style: Theme.of(context).textTheme.displaySmall,
                              ),
                            ),
                            SizedBox(
                              width: 34,
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  'total',
                                  style:
                                      Theme.of(context).textTheme.displaySmall,
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
                            colors:
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
              padding: const EdgeInsets.only(left: 18),
              child: Align(
                alignment: Alignment.centerRight,
                child: Selector<ScoresheetModel, List<int>>(
                  selector:
                      (_, ScoresheetModel scoresheetModel) =>
                          scoresheetModel
                              .getScoresheet(scoresheetIndex)
                              .scoreData[endIndex],
                  builder:
                      (_, __, ___) => Text(
                        '${scoresheet.getSingleScoreEnd(endIndex, scoresheet.target.formattedScores.length - 1)}',
                      ),
                ),
              ),
            ),
            SizedBox(
              width: 34,
              child: Align(
                alignment: Alignment.centerRight,
                child: Selector<ScoresheetModel, List<int>>(
                  selector:
                      (_, ScoresheetModel scoresheetModel) =>
                          scoresheetModel
                              .getScoresheet(scoresheetIndex)
                              .scoreData[endIndex],
                  builder:
                      (_, __, ___) =>
                          Text('${scoresheet.getTotalScoreEnd(endIndex)}'),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
