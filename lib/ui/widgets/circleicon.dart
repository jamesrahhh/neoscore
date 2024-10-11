import 'package:flutter/material.dart';
import 'dart:math';
import 'package:neoscore/ui/widgets/transparentcirclearea.dart';

class CircleIcon extends StatelessWidget {
  final double radius;

  const CircleIcon({super.key, required this.radius});

  @override
  Widget build(BuildContext context) {
    return TransparentCircleArea(
        radius: radius / 3,
        child: Container(
          width: radius,
          height: radius,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius / 2),
            gradient: LinearGradient(
                colors: <Color>[Colors.green, Colors.greenAccent],
                transform: GradientRotation(pi / 4)),
          ),
        ));
  }
}
