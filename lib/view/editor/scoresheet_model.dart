import 'package:flutter/widgets.dart';

import '../../common/scoresheet/scoresheet.dart';
import '../../common/target/target.dart';

class ScoresheetModel extends ChangeNotifier {
  ScoresheetModel(Scoresheet scoresheet) {
    _scoresheet = scoresheet;
  }

  late Scoresheet _scoresheet;

  void addScore(int endIndex, int value) {
    if (_scoresheet.scoreData[endIndex].length < _scoresheet.shotsPerEnd) {
      _scoresheet.scoreData[endIndex] = <int>[
        ..._scoresheet.scoreData[endIndex],
        value,
      ];
      _scoresheet.scoreData[endIndex].sort((int a, int b) => b.compareTo(a));
    }
  }

  void deleteScore(int endIndex) {
    if (_scoresheet.scoreData[endIndex].isNotEmpty) {
      _scoresheet.scoreData[endIndex] = <int>[
        ..._scoresheet.scoreData[endIndex],
      ];
      _scoresheet.scoreData[endIndex].removeLast();
    }
  }

  int getTotalScoreEnd(int endIndex) {
    if (endIndex >= _scoresheet.scoreData.length) {
      return 0;
    }
    int total = 0;
    for (final int shot in _scoresheet.scoreData[endIndex]) {
      total +=
          shot > _scoresheet.target.highestScore
              ? _scoresheet.target.highestScore
              : shot;
    }
    return total;
  }

  int getSingleScoreEnd(int endIndex, int score) {
    if (endIndex >= _scoresheet.scoreData.length) {
      return 0;
    }
    int total = 0;
    for (final int shot in _scoresheet.scoreData[endIndex]) {
      if (shot == score) {
        total++;
      }
    }
    return total;
  }

  int get getTotalScore {
    int total = 0;
    for (final List<int> end in _scoresheet.scoreData) {
      for (final int shot in end) {
        total +=
            shot > _scoresheet.target.highestScore
                ? _scoresheet.target.highestScore
                : shot;
      }
    }
    return total;
  }

  int getSingleScore(int score) {
    int total = 0;
    for (final List<int> end in _scoresheet.scoreData) {
      for (final int shot in end) {
        if (shot == score) {
          total++;
        }
      }
    }
    return total;
  }

  int get getLastEnd {
    for (int endIndex = 0; endIndex < _scoresheet.ends; endIndex++) {
      if (_scoresheet.scoreData[endIndex].length < _scoresheet.shotsPerEnd) {
        return endIndex;
      }
    }
    return _scoresheet.ends - 1;
  }

  int get shotsPerEnd => _scoresheet.shotsPerEnd;

  int get ends => _scoresheet.ends;

  int get currentEnds => _scoresheet.scoreData.length;

  Target get target => _scoresheet.target;

  String get name => _scoresheet.name;

  List<int> getEnd(int endIndex) => _scoresheet.scoreData[endIndex];
}
