import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/target/target.dart';
import '../../../util/theme/colors.dart';
import '../../widgets/empty_score_icon.dart';
import '../../widgets/score_icon.dart';
import '../editor_viewmodel.dart';
import 'editor_row.dart';

class EditorKeyboard extends StatelessWidget {
  const EditorKeyboard({super.key, required this.endIndex});

  final int endIndex;

  @override
  Widget build(BuildContext context) {
    final ThemeColors themeColors = Theme.of(context).extension<ThemeColors>()!;
    final Target target =
        Provider.of<EditorViewModel>(context, listen: false).target;

    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
          child: EditorRow(endIndex: endIndex),
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
                        Provider.of<EditorViewModel>(
                          context,
                          listen: false,
                        ).addScore(
                          endIndex: endIndex,
                          value: target.formattedScores.length - index - 1,
                        );
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
                          () => Provider.of<EditorViewModel>(
                            context,
                            listen: false,
                          ).deleteScore(endIndex: endIndex),
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
