import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../scoresheet_viewmodel.dart';
import 'score_icon.dart';

class ScoresheetEditor extends StatelessWidget {
  const ScoresheetEditor({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) => Scaffold(
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
                Provider.of<ScoresheetViewModel>(
                  context,
                ).getScoresheet(index).shotsPerEnd,
                (int shotIndex) => ScoreIcon(
                  value:
                      Provider.of<ScoresheetViewModel>(context)
                          .getScoresheet(index)
                          .scoreData[endIndex][shotIndex]
                          .toString(),
                  color: Colors.blueAccent,
                ),
              ) +
              <Widget>[
                Text(
                  '${Provider.of<ScoresheetViewModel>(context).getScoresheet(index).getSingleScoreEnd(endIndex, Provider.of<ScoresheetViewModel>(context).getScoresheet(index).highestScore + 1)}',
                ),
                Text(
                  '${Provider.of<ScoresheetViewModel>(context).getScoresheet(index).getTotalScoreEnd(endIndex)}',
                ),
              ],
        ),
      ),
    ),
  );
}
