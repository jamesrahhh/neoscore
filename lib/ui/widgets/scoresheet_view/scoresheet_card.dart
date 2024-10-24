import 'package:flutter/material.dart';

class ScoresheetCard extends StatelessWidget {
  const ScoresheetCard({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
        child: Card(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
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
                Divider(
                  color: Theme.of(context).colorScheme.secondary,
                ),
                const Placeholder(
                  fallbackHeight: 90,
                ),
              ],
            ),
          ),
        ),
      );
}
