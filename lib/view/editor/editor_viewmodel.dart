import 'package:flutter/widgets.dart';

import '../../common/scoresheet/scoresheet.dart';
import '../../common/target/target.dart';

class EditorViewModel extends ChangeNotifier {
  EditorViewModel({required Scoresheet scoresheet}) : _scoresheet = scoresheet;

  final Scoresheet _scoresheet;

  void addScore({required int endIndex, required int value}) {
    if (_scoresheet.scoreData[endIndex].length < _scoresheet.shotsPerEnd) {
      _scoresheet.scoreData[endIndex] = <int>[
        ..._scoresheet.scoreData[endIndex],
        value,
      ];
      _scoresheet.scoreData[endIndex].sort((int a, int b) => b.compareTo(a));
      notifyListeners();
    }
  }

  void deleteScore({required int endIndex}) {
    if (_scoresheet.scoreData[endIndex].isNotEmpty) {
      _scoresheet.scoreData[endIndex] = <int>[
        ..._scoresheet.scoreData[endIndex],
      ];
      _scoresheet.scoreData[endIndex].removeLast();
      notifyListeners();
    }
  }

  int getTotalScoreEnd({required int endIndex}) {
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

  int getSingleScoreEnd({required int endIndex, required int score}) {
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

  int getSingleScore({required int score}) {
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

  int get shotsPerEnd => _scoresheet.shotsPerEnd;

  int get ends => _scoresheet.ends;

  Target get target => _scoresheet.target;

  String get name => _scoresheet.name;

  List<int> getEnd(int endIndex) => _scoresheet.scoreData[endIndex];
}
