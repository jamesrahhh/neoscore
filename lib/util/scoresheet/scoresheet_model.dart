import 'package:flutter/foundation.dart';

import '../../common/scoresheet/scoresheet.dart';
import '../../common/target/target.dart';

class ScoresheetModel extends ChangeNotifier {
  final List<Scoresheet> _scoresheets = <Scoresheet>[];

  Scoresheet getScoresheet(int index) {
    return _scoresheets[index];
  }

  int createScoresheet(String name, int shotsPerEnd, int ends, Target target) {
    _scoresheets.add(
      Scoresheet(
        name: name,
        scoreData: List<List<int>>.generate(ends, (_) => <int>[]),
        ends: ends,
        shotsPerEnd: shotsPerEnd,
        target: target,
      ),
    );
    return getScoresheetAmount - 1;
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
