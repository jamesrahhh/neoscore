import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// Target object.
///
/// Takes [name], the name of the target, [maxScore] the maximum possible score on the given target,
/// [lightText], whether light text should be used for visibility,
/// and [getRingGradient], a function that returns a list containing the primary and secondary ring colors
/// of the target.
class Target {
  final String name;
  final int maxScore;
  final LinearGradient Function(int) getRingGradient;
  final Color Function(int) getTextColor;

  Target(
      {required this.name,
      required this.maxScore,
      required this.getTextColor,
      required this.getRingGradient});
}
