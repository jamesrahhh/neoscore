// ignore_for_file: non_constant_identifier_names

class Target {
  Target({
    required this.formattedScores,
    required this.colors,
    required this.highestScore,
  });

  Target.NFAA({
    this.formattedScores = const <String>['M', '1', '2', '3', '4', '5', 'X'],
    this.colors = const <int>[5, 3, 3, 3, 3, 4, 4],
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
    this.colors = const <int>[5, 4, 4, 6, 6, 2, 2, 0, 0, 1, 1],
    this.highestScore = 10,
  });

  List<String> formattedScores;
  List<int> colors;
  int highestScore;
}
