import 'dart:math';

import 'package:flutter/widgets.dart';

import '../../common/scoresheet/scoresheet.dart';

class EditorViewModel extends ChangeNotifier {
  EditorViewModel({required Scoresheet scoresheet}) : _scoresheet = scoresheet;

  final Scoresheet _scoresheet;

  void addScore({required int endIndex, required int score}) {
    while (endIndex >= _scoresheet.arrows.length) {
      _scoresheet.arrows.add(<int>[]);
    }
    if (_scoresheet.arrows[endIndex].length >= _scoresheet.shotsPerEnd) {
      return;
    }
    _scoresheet.arrows[endIndex] = <int>[
      ..._scoresheet.arrows[endIndex],
      score,
    ];
    _scoresheet.arrows[endIndex].sort((int a, int b) => b.compareTo(a));
    notifyListeners();
  }

  void deleteScore({required int endIndex}) {
    if (endIndex >= _scoresheet.arrows.length || _scoresheet.arrows[endIndex].isEmpty) {
      return;
    }
    _scoresheet.arrows[endIndex] = <int>[
      ..._scoresheet.arrows[endIndex].sublist(
        0,
        _scoresheet.arrows[endIndex].length - 1,
      ),
    ];
    notifyListeners();
  }

  double getAverageArrow() {
    int arrows = 0;
    double average = 0;
    for (final List<int> end in _scoresheet.arrows) {
      for (final int score in end) {
        arrows++;
        average += min(score, _scoresheet.target.highestScore);
      }
    }
    if (arrows == 0) {
      return 0;
    } else {
      return average / arrows;
    }
  }

  int getTotalScoreEnd({required int endIndex}) {
    if (endIndex >= _scoresheet.arrows.length) {
      return 0;
    }
    int total = 0;
    for (final int shot in _scoresheet.arrows[endIndex]) {
      total += shot > _scoresheet.target.highestScore ? _scoresheet.target.highestScore : shot;
    }
    return total;
  }

  int getSingleScoreEnd({required int endIndex, required int score}) {
    if (endIndex >= _scoresheet.arrows.length) {
      return 0;
    }
    int total = 0;
    for (final int shot in _scoresheet.arrows[endIndex]) {
      if (shot == score) {
        total++;
      }
    }
    return total;
  }

  int get getTotalScore {
    int total = 0;
    for (final List<int> end in _scoresheet.arrows) {
      for (final int shot in end) {
        total += shot > _scoresheet.target.highestScore ? _scoresheet.target.highestScore : shot;
      }
    }
    return total;
  }

  int getSingleScore({required int score}) {
    int total = 0;
    for (final List<int> end in _scoresheet.arrows) {
      for (final int shot in end) {
        if (shot == score) {
          total++;
        }
      }
    }
    return total;
  }

  List<int> getEnd(int endIndex) {
    if (endIndex >= _scoresheet.arrows.length) {
      return <int>[];
    } else {
      return _scoresheet.arrows[endIndex];
    }
  }

  Scoresheet get scoresheet => _scoresheet;
}
