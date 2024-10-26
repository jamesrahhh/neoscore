import 'package:flutter/material.dart';

class ScoreIcon extends StatelessWidget {
  const ScoreIcon({super.key, required this.value, required this.color});

  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Text(
              value,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Container(
              height: 3.0,
              width: 10.0,
              decoration: BoxDecoration(
                color: color,
                borderRadius: const BorderRadius.all(Radius.circular(1.5)),
              ),
            ),
          ],
        ),
      );
}
