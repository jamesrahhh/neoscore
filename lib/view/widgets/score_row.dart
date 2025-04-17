import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../util/theme/colors.dart';
import '../editor/scoresheet_model.dart';
import 'empty_score_icon.dart';
import 'score_icon.dart';

class ScoreRow extends StatelessWidget {
  const ScoreRow({super.key, required this.endIndex});

  final int endIndex;

  @override
  Widget build(BuildContext context) {
    final ThemeColors themeColors = Theme.of(context).extension<ThemeColors>()!;

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
                                "${Provider.of<ScoresheetModel>(context, listen: false).target.formattedScores.last.toLowerCase()}'s",
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
                        scoresheetModel.getEnd(endIndex),
                builder:
                    (_, List<int> end, __) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List<Widget>.generate(
                        Provider.of<ScoresheetModel>(
                          context,
                          listen: false,
                        ).shotsPerEnd,
                        (int shotIndex) {
                          if (Provider.of<ScoresheetModel>(
                                    context,
                                    listen: false,
                                  ).currentEnds <=
                                  endIndex ||
                              end.length <= shotIndex) {
                            return const EmptyScoreIcon();
                          } else {
                            return ScoreIcon(
                              value:
                                  Provider.of<ScoresheetModel>(
                                    context,
                                    listen: false,
                                  ).target.formattedScores[end[shotIndex]],
                              colors:
                                  themeColors
                                      .colors![Provider.of<ScoresheetModel>(
                                    context,
                                    listen: false,
                                  ).target.colors[end[shotIndex]]],
                            );
                          }
                        },
                      ),
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
                          scoresheetModel.getEnd(endIndex),
                  builder:
                      (_, __, ___) => Text(
                        '${Provider.of<ScoresheetModel>(context, listen: false).getSingleScoreEnd(endIndex, Provider.of<ScoresheetModel>(context, listen: false).target.formattedScores.length - 1)}',
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
                          scoresheetModel.getEnd(endIndex),
                  builder:
                      (_, __, ___) => Text(
                        '${Provider.of<ScoresheetModel>(context, listen: false).getTotalScoreEnd(endIndex)}',
                      ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
