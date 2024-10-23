import 'package:flutter/material.dart';

import '../../widgets/scoresheet_view/scoresheet_card.dart';

class ScoresheetView extends StatelessWidget {
  const ScoresheetView({super.key});

  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0.0),
            child: Row(
              children: <Widget>[
                Text(
                  'Generic Header',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ],
            ),
          ),
          const ScoresheetCard(),
          const ScoresheetCard(),
        ],
      );
}
