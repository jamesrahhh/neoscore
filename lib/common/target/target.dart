// ignore_for_file: non_constant_identifier_names

class Target {
  Target({
    required this.formattedName,
    required this.formattedScores,
    required this.colors,
    required this.highestScore,
  });

  Target.NFAA({
    this.formattedName = 'NFAA',
    this.formattedScores = const <String>['M', '1', '2', '3', '4', '5', 'X'],
    this.colors = const <int>[5, 3, 3, 3, 3, 4, 4],
    this.highestScore = 5,
  });

  Target.NFAA_IX({
    this.formattedName = 'NFAA - IX',
    this.formattedScores = const <String>[
      'M',
      '1',
      '2',
      '3',
      '4',
      '5',
      'X',
      'IX',
    ],
    this.colors = const <int>[5, 3, 3, 3, 3, 4, 4, 4],
    this.highestScore = 5,
  });

  Target.USA({
    this.formattedName = 'USA',
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

  String formattedName;
  List<String> formattedScores;
  List<int> colors;
  int highestScore;

  static List<Target> get getTargets => <Target>[
    Target.NFAA(),
    Target.NFAA_IX(),
    Target.USA(),
  ];
}
