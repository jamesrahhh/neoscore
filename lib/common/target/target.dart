// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class Target {
  Target({
    required this.formattedScores,
    required this.colors,
    required this.highestScore,
  });

  Target.NFAA({
    this.formattedScores = const <String>['M', '1', '2', '3', '4', '5', 'X'],
    this.colors = const <Color>[],
    this.highestScore = 5,
  });

  Target.USA({
    this.formattedScores = const <String>[
      'M',
      '1',
      '2',
      '3',
      '4',
      '5',
      '6',
      '7',
      '8',
      '9',
      '10',
    ],
    this.colors = const <Color>[],
    this.highestScore = 10,
  });

  List<String> formattedScores;
  List<Color> colors;
  int highestScore;
}
