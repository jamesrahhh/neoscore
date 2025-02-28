import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/scoresheet/scoresheet.dart';
import '../scoresheet_viewmodel.dart';
import 'score_icon.dart';

class ScoresheetCard extends StatelessWidget {
  const ScoresheetCard({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    final Scoresheet scoresheet = Provider.of<ScoresheetViewModel>(
      context,
      listen: false,
    ).getScoresheet(index);
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
      child: ColoredBox(
        color: Theme.of(context).colorScheme.surfaceContainer,
        child: Column(
          children: <Widget>[
            ColoredBox(
              color: Theme.of(context).colorScheme.primary,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Scoresheet ${index + 1}',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const Icon(Icons.more_vert),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: List<Widget>.generate(
                  2,
                  (int endIndex) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List<Widget>.generate(
                      scoresheet.shotsPerEnd,
                      (int shotIndex) => ScoreIcon(
                        value:
                            scoresheet.scoreData[endIndex][shotIndex]
                                .toString(),
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
