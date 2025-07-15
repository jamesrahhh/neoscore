import 'package:flutter/material.dart';

class EmptyScoreIcon extends StatelessWidget {
  const EmptyScoreIcon({super.key, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) => SizedBox(
        width: 48,
        height: 48,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(24)),
            border: Border.all(color: Colors.grey),
          ),
          child: child,
        ),
      );
}
