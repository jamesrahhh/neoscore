import 'package:flutter/material.dart';

/// Target object.
///
/// Takes [name], the name of the target, [maxScore] the maximum possible score on the given target,
/// and [getRingColors], a function that returns a list containing the primary and secondary ring colors
/// of the target as well as a text color.
class Target {
  final String name;
  final int maxScore;
  final List<Color> Function(int) getRingColors;

  Target(
      {required this.name,
      required this.maxScore,
      required this.getRingColors});
}
