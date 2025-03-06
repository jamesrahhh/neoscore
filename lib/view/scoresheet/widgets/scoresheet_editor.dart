import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/scoresheet/scoresheet.dart';
import '../../../util/theme/colors.dart';
import '../scoresheet_viewmodel.dart';
import 'empty_score_icon.dart';
import 'score_icon.dart';

class ScoresheetEditor extends StatelessWidget {
  const ScoresheetEditor({super.key});

  @override
  Widget build(BuildContext context) {
    final Scoresheet scoresheet = Provider.of<ScoresheetViewModel>(
      context,
      listen: false,
    ).getScoresheet(
      Provider.of<ScoresheetViewModel>(context, listen: false).scoresheetIndex,
    );
    final ThemeColors themeColors = Theme.of(context).extension<ThemeColors>()!;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Editor'),
        leading: IconButton(
          onPressed:
              () => Provider.of<ScoresheetViewModel>(
                context,
                listen: false,
              ).setPage(0),
          icon: const Icon(Icons.arrow_left),
        ),
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 500,
          mainAxisExtent: 48.0,
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
        ),
        children:
            List<Widget>.generate(
              scoresheet.ends,
              (int endIndex) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 24.0, right: 8.0),
                    child: SizedBox(width: 24, child: Text('${endIndex + 1}')),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List<Widget>.generate(scoresheet.shotsPerEnd, (
                        int shotIndex,
                      ) {
                        if (scoresheet.scoreData.length <= endIndex ||
                            scoresheet.scoreData[endIndex].length <=
                                shotIndex) {
                          return const EmptyScoreIcon();
                        } else {
                          return ScoreIcon(
                            value:
                                scoresheet.target.formattedScores[scoresheet
                                    .scoreData[endIndex][shotIndex]],
                            color:
                                themeColors.colors![scoresheet
                                    .target
                                    .colors[scoresheet
                                    .scoreData[endIndex][shotIndex]]],
                          );
                        }
                      }),
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
              ),
            ) +
            <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 6.0),
                    child: SizedBox(
                      width: 24,
                      child: Text(
                        '${scoresheet.getSingleScore(scoresheet.target.formattedScores.length - 1)}',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 6.0, right: 24.0),
                    child: SizedBox(
                      width: 24,
                      child: Text('${scoresheet.getTotalScore}'),
                    ),
                  ),
                ],
              ),
            ],
      ),
    );
  }
}
