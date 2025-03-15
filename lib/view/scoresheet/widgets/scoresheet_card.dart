import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../scoresheet_model.dart';
import '../scoresheet_viewmodel.dart';
import 'score_row.dart';

class ScoresheetCard extends StatelessWidget {
  const ScoresheetCard({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
      child: ColoredBox(
        color: Theme.of(context).colorScheme.surfaceContainer,
        child: Column(
          children: <Widget>[
            ColoredBox(
              color: Theme.of(context).colorScheme.primary,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Scoresheet ${index + 1}',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.more_vert),
                    onPressed: () {
                      Provider.of<ScoresheetModel>(
                        context,
                        listen: false,
                      ).setScoresheet(index);
                      Provider.of<ScoresheetViewModel>(
                        context,
                        listen: false,
                      ).setPage(1);
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: List<Widget>.generate(
                  2,
                  (int endIndex) =>
                      ScoreRow(scoresheetIndex: index, endIndex: endIndex),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
