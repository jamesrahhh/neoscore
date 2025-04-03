import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/target/target.dart';
import '../../../common/widgets/empty_score_icon.dart';
import '../../../common/widgets/score_icon.dart';
import '../../../common/widgets/score_row.dart';
import '../../../util/scoresheet/scoresheet_model.dart';
import '../../../util/theme/colors.dart';

class EditorKeyboard extends StatelessWidget {
  const EditorKeyboard({
    super.key,
    required this.scoresheetIndex,
    required this.endIndex,
  });

  final int scoresheetIndex;
  final int endIndex;

  @override
  Widget build(BuildContext context) {
    final ThemeColors themeColors = Theme.of(context).extension<ThemeColors>()!;
    final Target target =
        Provider.of<ScoresheetModel>(
          context,
          listen: false,
        ).getScoresheet(scoresheetIndex).target;

    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
          child: ScoreRow(scoresheetIndex: scoresheetIndex, endIndex: endIndex),
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
              children:
                  List<Widget>.generate(
                    target.formattedScores.length,
                    (int index) => InkWell(
                      onTap: () {
                        Provider.of<ScoresheetModel>(
                          context,
                          listen: false,
                        ).addScore(
                          scoresheetIndex,
                          endIndex,
                          target.formattedScores.length - index - 1,
                        );
                        if (Provider.of<ScoresheetModel>(context, listen: false)
                                    .getScoresheet(scoresheetIndex)
                                    .scoreData[endIndex]
                                    .length ==
                                Provider.of<ScoresheetModel>(
                                  context,
                                  listen: false,
                                ).getScoresheet(scoresheetIndex).shotsPerEnd &&
                            endIndex <=
                                Provider.of<ScoresheetModel>(
                                  context,
                                  listen: false,
                                ).getScoresheet(scoresheetIndex).ends) {
                          Navigator.pop(context);
                          showModalBottomSheet<void>(
                            context: context,
                            builder:
                                (_) =>
                                    ListenableProvider<ScoresheetModel>.value(
                                      value: Provider.of<ScoresheetModel>(
                                        context,
                                        listen: false,
                                      ),
                                      child: EditorKeyboard(
                                        scoresheetIndex: scoresheetIndex,
                                        endIndex:
                                            Provider.of<ScoresheetModel>(
                                                  context,
                                                  listen: false,
                                                )
                                                .getScoresheet(scoresheetIndex)
                                                .getLastEnd,
                                      ),
                                    ),
                          );
                        }
                      },
                      child: ScoreIcon(
                        value:
                            target.formattedScores[target
                                    .formattedScores
                                    .length -
                                index -
                                1],
                        colors:
                            themeColors.colors![target.colors[target
                                    .formattedScores
                                    .length -
                                index -
                                1]],
                      ),
                    ),
                  ) +
                  <Widget>[
                    InkWell(
                      onTap:
                          () => Provider.of<ScoresheetModel>(
                            context,
                            listen: false,
                          ).deleteScore(scoresheetIndex, endIndex),
                      child: const EmptyScoreIcon(child: Icon(Icons.delete)),
                    ),
                  ],
            ),
          ),
        ),
      ],
    );
  }
}
