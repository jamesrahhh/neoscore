import 'package:flutter/material.dart';

class ScoreIcon extends StatelessWidget {
  const ScoreIcon({super.key, required this.value, required this.color});

  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(4.0),
    child: SizedBox(
      width: 35.0,
      height: 35.0,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(4)),
          color: color,
        ),
        child: Center(
          child: Text(value, style: Theme.of(context).textTheme.bodyMedium),
        ),
      ),
    ),
  );
}
