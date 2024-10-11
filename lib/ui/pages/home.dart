import 'package:flutter/material.dart';
import 'package:neoscore/ui/widgets/circleicon.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
          body: Center(
        child:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Padding(
              padding: const EdgeInsets.all(6.0),
              child: CircleIcon(radius: 35)),
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
