import 'package:flutter/material.dart';

class TransparentCircleArea extends StatelessWidget {
  final double radius;
  final Widget? child;
  const TransparentCircleArea({super.key, required this.radius, this.child});

  @override
  Widget build(BuildContext context) => ClipPath(
        clipper: TransparentClipper(radius: radius),
        child: child,
      );
}

class TransparentClipper extends CustomClipper<Path> {
  final double radius;
  TransparentClipper({required this.radius});

  @override
  Path getClip(Size size) => Path()
    ..addRect(Rect.fromPoints(Offset(0, 0), Offset(size.width, size.height)))
    ..addOval(Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2), radius: radius))
    ..fillType = PathFillType.evenOdd;

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
