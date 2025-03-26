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

  Scoresheet getCurrentScoresheet() {
    return _scoresheets[_scoresheetIndex];
  }

  Target getCurrentTarget() {
    return getScoresheet(_scoresheetIndex).target;
  }

  int _scoresheetIndex = 0;

  int get scoresheetIndex => _scoresheetIndex;

  void setScoresheet(int index) {
    _scoresheetIndex = index;
    notifyListeners();
  }

  int get getScoresheetAmount => _scoresheets.length;

  void addScore(int endIndex, int value) {
    if (_scoresheets[scoresheetIndex].scoreData[endIndex].length <
        _scoresheets[scoresheetIndex].shotsPerEnd) {
      _scoresheets[scoresheetIndex].scoreData[endIndex] = <int>[
        ..._scoresheets[scoresheetIndex].scoreData[endIndex],
      ];
      _scoresheets[scoresheetIndex].scoreData[endIndex].add(value);
      _scoresheets[scoresheetIndex].scoreData[endIndex].sort(
        (int a, int b) => b.compareTo(a),
      );
      notifyListeners();
    }
  }

  void deleteScore(int endIndex) {
    if (_scoresheets[scoresheetIndex].scoreData[endIndex].isNotEmpty) {
      _scoresheets[scoresheetIndex].scoreData[endIndex] = <int>[
        ..._scoresheets[scoresheetIndex].scoreData[endIndex],
      ];
      _scoresheets[scoresheetIndex].scoreData[endIndex].removeLast();
      notifyListeners();
    }
  }
}
