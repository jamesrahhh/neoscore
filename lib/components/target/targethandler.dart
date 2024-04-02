import 'package:flutter/material.dart';
import 'package:neuralflight/components/target/target.dart';

class TargetHandler {
  static List<Target> targets = [
    Target(
      name: 'NFAA',
      maxScore: 5,
      getRingGradient: (score) {
        if (score >= 5) {
          return const LinearGradient(
              colors: [Colors.white, Color.fromARGB(255, 235, 235, 235)]);
        } else if (score >= 1) {
          return const LinearGradient(colors: [
            Color.fromARGB(255, 30, 60, 95),
            Color.fromARGB(255, 10, 40, 75),
          ]);
        } else {
          return const LinearGradient(colors: [
            Color.fromARGB(255, 190, 190, 190),
            Color.fromARGB(255, 170, 170, 170),
          ]);
        }
      },
      getTextColor: (score) {
        if (score >= 5) {
          return Colors.black;
        } else if (score >= 1) {
          return Colors.white;
        } else {
          return Colors.black;
        }
      },
    ),
    Target(
      name: 'USA',
      maxScore: 10,
      getRingGradient: (score) {
        if (score >= 9) {
          return const LinearGradient(
              colors: [Color.fromARGB(255, 255, 245, 50)]);
        } else if (score >= 7) {
          return const LinearGradient(
              colors: [Color.fromARGB(255, 255, 25, 20)]);
        } else if (score >= 5) {
          return const LinearGradient(
              colors: [Color.fromARGB(255, 65, 185, 200)]);
        } else if (score >= 3) {
          return const LinearGradient(colors: [Colors.black]);
        } else if (score >= 1) {
          return const LinearGradient(colors: [Colors.white]);
        } else {
          return const LinearGradient(colors: [
            Color.fromARGB(255, 190, 190, 190),
            Color.fromARGB(255, 170, 170, 170)
          ]);
        }
      },
      getTextColor: (score) {
        return Colors.black;
      },
    )
  ];

  /// Parses numerical scores into strings.
  ///
  /// Takes [targetIndex] as the target within TargetHandler.targets and [score] as the score of the arrow.
  /// Returns the score as an X or M as needed.
  static String parseScore(int targetIndex, int score) {
    if (score > targets[targetIndex].maxScore) {
      return 'X';
    } else if (score == 0) {
      return 'M';
    }
    return '$score';
  }
}
