import 'package:flutter/material.dart';

import '../widgets/circleicon.dart';
import '../widgets/navigation.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
      bottomNavigationBar: const Navigation(),
      body: Center(
        child:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          const Padding(
              padding: EdgeInsets.all(6.0), child: CircleIcon(radius: 35)),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Text(
              'Neoscore',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ]),
      ));
}
