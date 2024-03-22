import 'package:flutter/material.dart';
import 'package:neuralflight/components/object/target.dart';

class TargetHandler {
  static List<Target> targets = [
    Target(
        name: 'NFAA',
        maxScore: 5,
        getRingColors: (score) {
          if (score >= 5) {
            return [
              Colors.white,
              const Color.fromARGB(255, 235, 235, 235),
              Colors.black
            ];
          } else if (score >= 1) {
            return [
              const Color.fromARGB(255, 30, 60, 95),
              const Color.fromARGB(255, 10, 40, 75),
              Colors.white
            ];
          } else {
            return [
              const Color.fromARGB(255, 190, 190, 190),
              const Color.fromARGB(255, 170, 170, 170),
              Colors.black
            ];
          }
        }),
    Target(
        name: 'USA',
        maxScore: 10,
        getRingColors: (score) {
          if (score >= 9) {
            return [const Color.fromARGB(255, 255, 245, 50)];
          } else if (score >= 7) {
            return [const Color.fromARGB(255, 255, 25, 20)];
          } else if (score >= 5) {
            return [const Color.fromARGB(255, 65, 185, 200)];
          } else if (score >= 3) {
            return [Colors.black];
          } else if (score >= 1) {
            return [Colors.white];
          } else {
            return [
              const Color.fromARGB(255, 190, 190, 190),
              const Color.fromARGB(255, 170, 170, 170),
              Colors.black
            ];
          }
        })
  ];

  /// Parses numerical scores into strings.
  ///
  /// Takes [target] as the target and [score] as the score of the arrow.
  /// Returns the score as an X or M as needed.
  static String parseScore(Target target, int score) {
    if (score > target.maxScore) {
      return 'X';
    } else if (score == 0) {
      return 'M';
    }
    return '$score';
  }
}
