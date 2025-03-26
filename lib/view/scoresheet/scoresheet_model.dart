import 'package:flutter/foundation.dart';

import '../../common/scoresheet/scoresheet.dart';
import '../../common/target/target.dart';

class ScoresheetModel extends ChangeNotifier {
  final List<Scoresheet> _scoresheets = <Scoresheet>[
    Scoresheet(
      scoreData: <List<int>>[
        <int>[],
        <int>[],
        <int>[],
        <int>[],
        <int>[],
        <int>[],
        <int>[],
        <int>[],
        <int>[],
        <int>[],
        <int>[],
        <int>[],
        <int>[],
        <int>[],
        <int>[],
        <int>[],
        <int>[],
        <int>[],
        <int>[],
        <int>[],
      ],
      shotsPerEnd: 3,
      ends: 20,
      target: Target.USA(),
    ),
    Scoresheet(
      scoreData: <List<int>>[
        <int>[6, 6, 6, 6, 6],
        <int>[6, 6, 6, 6, 6],
        <int>[6, 6, 6, 6, 6],
        <int>[6, 6, 6, 6, 6],
        <int>[6, 6, 6, 6, 6],
        <int>[6, 6, 6, 6, 6],
        <int>[6, 6, 6, 6, 6],
        <int>[6, 6, 6, 6, 6],
        <int>[6, 6, 6, 6, 6],
        <int>[6, 6, 6, 6, 6],
        <int>[6, 6, 6, 6, 6],
        <int>[6, 6, 6, 6, 6],
      ],
      shotsPerEnd: 5,
      ends: 12,
      target: Target.NFAA(),
    ),
  ];

  Scoresheet getScoresheet(int index) {
    return _scoresheets[index];
  }

  int get getScoresheetAmount => _scoresheets.length;

  void addScore(int scoresheetIndex, int endIndex, int value) {
    _scoresheets[scoresheetIndex].addScore(endIndex, value);
    notifyListeners();
  }

  void deleteScore(int scoresheetIndex, int endIndex) {
    _scoresheets[scoresheetIndex].deleteScore(endIndex);
    notifyListeners();
  }
}
