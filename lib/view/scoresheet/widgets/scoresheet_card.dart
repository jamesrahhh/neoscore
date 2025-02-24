import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../scoresheet_viewmodel.dart';
import 'score_icon.dart';

class ScoresheetCard extends StatelessWidget {
  const ScoresheetCard({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
    child: Container(
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.onSecondary),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Scoresheet ${index + 1}',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const Icon(Icons.more_vert),
              ],
            ),
            Divider(color: Theme.of(context).colorScheme.onSecondary),
            Column(
              children: List<Widget>.generate(
                2,
                (int endIndex) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List<Widget>.generate(
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
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
