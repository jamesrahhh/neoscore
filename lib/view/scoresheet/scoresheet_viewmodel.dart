import 'package:flutter/foundation.dart';

import '../../common/scoresheet/scoresheet.dart';

class ScoresheetViewModel extends ChangeNotifier {
  final List<Scoresheet> _scoresheets = <Scoresheet>[
    Scoresheet(
      scoreData: <List<int>>[
        <int>[1, 2, 3, 4, 5],
        <int>[1, 2, 3, 4, 5],
        <int>[1, 2, 3, 4, 5],
      ],
      shotsPerEnd: 5,
      highestScore: 5,
    ),
    Scoresheet(
      scoreData: <List<int>>[
        <int>[6, 6, 6, 6, 6],
        <int>[6, 6, 6, 6, 6],
        <int>[6, 6, 6, 6, 6],
      ],
      shotsPerEnd: 5,
      highestScore: 5,
    ),
    Scoresheet(
      scoreData: <List<int>>[
        <int>[10, 7, 5],
        <int>[9, 5, 4],
        <int>[10, 9, 7],
      ],
      shotsPerEnd: 3,
      highestScore: 10,
    ),
  ];

  Scoresheet getScoresheet(int index) {
    return _scoresheets[index];
  }

  int get getScoresheetAmount => _scoresheets.length;

  int _pageIndex = 0;

  int get pageIndex => _pageIndex;

  void setPage(int index) {
    _pageIndex = index;
    notifyListeners();
  }
}
