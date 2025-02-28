import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/scoresheet/scoresheet.dart';
import '../scoresheet_viewmodel.dart';
import 'score_icon.dart';

class ScoresheetEditor extends StatelessWidget {
  const ScoresheetEditor({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    final Scoresheet scoresheet = Provider.of<ScoresheetViewModel>(
      context,
      listen: false,
    ).getScoresheet(index);
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
      body: Column(
        children: List<Widget>.generate(
          2,
          (int endIndex) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:
                <Widget>[Text('${endIndex + 1}')] +
                List<Widget>.generate(
                  scoresheet.shotsPerEnd,
                  (int shotIndex) => ScoreIcon(
                    value:
                        scoresheet.target.formattedScores[scoresheet
                            .scoreData[endIndex][shotIndex]],
                    color: Colors.blueAccent,
                  ),
                ) +
                <Widget>[
                  Text(
                    '${scoresheet.getSingleScoreEnd(endIndex, scoresheet.target.formattedScores.length - 1)}',
                  ),
                  Text('${scoresheet.getTotalScoreEnd(endIndex)}'),
                ],
          ),
        ),
      ),
    );
  }
}
