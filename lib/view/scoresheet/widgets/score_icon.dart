import 'package:flutter/material.dart';

class ScoreIcon extends StatelessWidget {
  const ScoreIcon({super.key, required this.value, required this.colors});

  final String value;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) => Container(
    width: 48,
    height: 48,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(24),
      gradient: LinearGradient(
        colors: colors,
        transform: const GradientRotation(1),
      ),
    ),
    child: Center(
      child: Container(
        width: 34,
        height: 34,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: Theme.of(context).colorScheme.surface,
        ),
        child: Center(
          child: Text(value, style: Theme.of(context).textTheme.bodyMedium),
        ),
      ),
    ),
  );
}
