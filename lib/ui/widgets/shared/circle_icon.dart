import 'dart:math';
import 'package:flutter/material.dart';

import 'transparent_circle_area.dart';

class CircleIcon extends StatelessWidget {
  const CircleIcon({super.key, required this.radius});

  final double radius;

  @override
  Widget build(BuildContext context) => TransparentCircleArea(
      radius: radius / 3,
      child: Container(
        width: radius,
        height: radius,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius / 2),
          gradient: const LinearGradient(
              colors: <Color>[Colors.green, Colors.greenAccent],
              transform: GradientRotation(pi / 4)),
        ),
      ));
}
