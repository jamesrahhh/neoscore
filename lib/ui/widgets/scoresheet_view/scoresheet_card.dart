import 'package:flutter/material.dart';

class ScoresheetCard extends StatelessWidget {
  const ScoresheetCard({super.key});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Scoresheet Name',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const Icon(Icons.more_vert),
                  ],
                ),
                Divider(
                  color: Theme.of(context).colorScheme.secondary,
                )
              ],
            ),
          ),
        ),
      );
}
