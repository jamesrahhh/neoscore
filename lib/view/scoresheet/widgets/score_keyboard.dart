import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../util/theme/colors.dart';
import '../scoresheet_model.dart';
import 'score_icon.dart';
import 'score_row.dart';

class ScoreKeyboard extends StatelessWidget {
  const ScoreKeyboard({super.key, required this.endIndex});

  final int endIndex;

  @override
  Widget build(BuildContext context) {
    final ThemeColors themeColors = Theme.of(context).extension<ThemeColors>()!;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          ScoreRow(
            scoresheetIndex:
                Provider.of<ScoresheetModel>(
                  context,
                  listen: false,
                ).scoresheetIndex,
            endIndex: endIndex,
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
                    Provider.of<ScoresheetModel>(
                      context,
                      listen: false,
                    ).getCurrentTarget().formattedScores.length,
                    (int index) => InkWell(
                      onTap:
                          () => Provider.of<ScoresheetModel>(
                            context,
                            listen: false,
                          ).addScore(endIndex, index),
                      child: ScoreIcon(
                        value:
                            Provider.of<ScoresheetModel>(
                              context,
                              listen: false,
                            ).getCurrentTarget().formattedScores[index],
                        color:
                            themeColors.colors![Provider.of<ScoresheetModel>(
                              context,
                              listen: false,
                            ).getCurrentTarget().colors[index]],
                      ),
                    ),
                  ) +
                  <Widget>[
                    InkWell(
                      onTap:
                          () => Provider.of<ScoresheetModel>(
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
