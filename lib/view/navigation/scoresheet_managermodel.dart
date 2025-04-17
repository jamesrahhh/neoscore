import 'package:flutter/foundation.dart';

import '../../common/scoresheet/scoresheet.dart';
import '../../common/target/target.dart';

class ScoresheetManagerModel extends ChangeNotifier {
  final List<Scoresheet> _scoresheets = <Scoresheet>[];

  Scoresheet getScoresheet(int index) {
    return _scoresheets[index];
  }

  int createScoresheet(String name, int shotsPerEnd, int ends, Target target) {
    _scoresheets.add(
      Scoresheet(
        name: name,
        ends: ends,
        shotsPerEnd: shotsPerEnd,
        target: target,
        scoreData: List<List<int>>.generate(ends, (_) => <int>[]),
      ),
    );
    return getScoresheetAmount - 1;
  }

  int get getScoresheetAmount => _scoresheets.length;
}
