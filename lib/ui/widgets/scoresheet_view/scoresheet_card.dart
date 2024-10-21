import 'package:flutter/material.dart';

import '../shared/circle_icon.dart';

class ScoresheetCard extends StatelessWidget {
  const ScoresheetCard({super.key});

  @override
  Widget build(BuildContext context) => Center(
        child:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          const Padding(
              padding: EdgeInsets.all(6.0), child: CircleIcon(radius: 35)),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Text(
              'Scoresheet',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ]),
      );
}
