import 'package:flutter/material.dart';
import 'package:neuralflight/components/object/scoresheet.dart';

class TargetHandler {
  static int getMaxScore(Target target) {
    if (target == Target.nfaa) {
      return 5;
    } else if (target == Target.usa) {
      return 10;
    }
    return 0;
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
