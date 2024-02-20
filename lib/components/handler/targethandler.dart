import 'package:flutter/material.dart';

enum Target { nfaa, usa }

class TargetHandler {
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

  static Color getRingColor(Target target, int score) {
    if (target == Target.nfaa) {
      if (score >= 5) {
        return Colors.white;
      } else {
        return const Color.fromARGB(255, 30, 60, 95);
      }
    } else if (target == Target.usa) {
      if (score >= 9) {
        return const Color.fromARGB(255, 255, 245, 50);
      } else if (score >= 7) {
        return const Color.fromARGB(255, 255, 25, 20);
      } else if (score >= 5) {
        return const Color.fromARGB(255, 65, 185, 200);
      } else if (score >= 3) {
        return Colors.black;
      } else {
        return Colors.white;
      }
    }
    return Colors.white;
  }
}
