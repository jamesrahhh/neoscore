import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../util/theme/colors.dart';
import '../scoresheet_model.dart';
import 'empty_score_icon.dart';
import 'score_icon.dart';
import 'score_row.dart';

class ScoreKeyboard extends StatelessWidget {
  const ScoreKeyboard({super.key, required this.endIndex});

  final int endIndex;

  @override
  Widget build(BuildContext context) {
    final ThemeColors themeColors = Theme.of(context).extension<ThemeColors>()!;

    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 2),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    '${endIndex + 1}',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ),
              ),
              ScoreRow(
                scoresheetIndex:
                    Provider.of<ScoresheetModel>(
                      context,
                      listen: false,
                    ).scoresheetIndex,
                endIndex: endIndex,
              ),
            ],
          ),
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
                        colors:
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
