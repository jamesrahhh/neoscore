import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: const LinearGradient(
            colors: <Color>[Colors.lightGreen, Colors.lightGreenAccent],
            transform: GradientRotation(1),
          ),
        ),
        child: Center(
          child: Container(
            width: 15,
            height: 15,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Theme.of(context).colorScheme.surface,
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 8),
        child: Text('Neoscore', style: Theme.of(context).textTheme.titleLarge),
      ),
    ],
  );
}
