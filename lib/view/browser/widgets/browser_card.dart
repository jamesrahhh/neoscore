import 'package:flutter/material.dart';

import '../../../common/scoresheet/scoresheet_card.dart';

class BrowserCard extends StatelessWidget {
  const BrowserCard({super.key, required this.card});

  final ScoresheetCard card;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: ColoredBox(
        color: Theme.of(context).colorScheme.surfaceContainer,
        child: Column(
          children: <Widget>[
            InkWell(
              onTap: () => VoidCallback,
              child: Padding(
                padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(
                        card.name,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    const Icon(Icons.more_vert),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 24, right: 24, top: 4, bottom: 4),
              child: Divider(),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Text('ends: ${card.ends}'),
            ),
          ],
        ),
      ),
    );
  }
}
