class Target {
  Target({
    required this.name,
    required this.formattedName,
    required this.formattedScores,
    required this.colors,
    required this.highestScore,
  });

  factory Target.fromName(String name) => _targets.firstWhere(
    (Target test) => test.name == name,
    orElse: () => _targets[0],
  );

  factory Target.fromFormattedName(String formattedName) => _targets.firstWhere(
    (Target test) => test.formattedName == formattedName,
    orElse: () => _targets[0],
  );

  String name;
  String formattedName;
  List<String> formattedScores;
  List<int> colors;
  int highestScore;

  static List<Target> get getTargets => _targets;

  static final List<Target> _targets = <Target>[
    Target(
      name: 'usa',
      formattedName: 'USA',
      formattedScores: const <String>[
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
      colors: const <int>[5, 4, 4, 6, 6, 2, 2, 0, 0, 1, 1],
      highestScore: 10,
    ),
    Target(
      name: 'nfaa_ix',
      formattedName: 'NFAA - IX',
      formattedScores: const <String>['M', '1', '2', '3', '4', '5', 'X', 'IX'],
      colors: const <int>[5, 3, 3, 3, 3, 4, 4, 4],
      highestScore: 5,
    ),
    Target(
      name: 'nfaa',
      formattedName: 'NFAA',
      formattedScores: const <String>['M', '1', '2', '3', '4', '5', 'X'],
      colors: const <int>[5, 3, 3, 3, 3, 4, 4],
      highestScore: 5,
    ),
  ];
}
