import 'package:flutter/material.dart';

enum Target { nfaa, usa }

class TargetHandler {
  /// Parses numerical scores into strings.
  ///
  /// Takes [target] as the target and [score] as the score of the arrow.
  /// Returns the score as an X or M as needed.
  static String parseScore(Target target, int score) {
    if (target == Target.nfaa && score > 5) {
      return 'X';
    } else if (target == Target.usa && score > 10) {
      return 'X';
    } else if (score == 0) {
      return 'M';
    }
    return '$score';
  }

  /// Gets the ring colors of a target ring.
  ///
  /// Takes [target] and [score] as the score of the ring.
  /// Returns a list containing the color of the ring,
  /// the secondary color for gradients, and the text color.
  static List<Color> getRingColors(Target target, int score) {
    if (target == Target.nfaa) {
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
      }
    } else if (target == Target.usa) {
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
      }
    }
    return [
      const Color.fromARGB(255, 190, 190, 190),
      const Color.fromARGB(255, 170, 170, 170),
      Colors.black
    ];
  }
}
