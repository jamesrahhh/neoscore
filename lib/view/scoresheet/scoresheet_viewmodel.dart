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
      highestScore: 6,
    ),
    Scoresheet(
      scoreData: <List<int>>[
        <int>[6, 6, 6, 6, 6],
        <int>[6, 6, 6, 6, 6],
        <int>[6, 6, 6, 6, 6],
      ],
      shotsPerEnd: 5,
      highestScore: 6,
    ),
    Scoresheet(
      scoreData: <List<int>>[
        <int>[5, 5, 4, 4, 3],
        <int>[6, 6, 5, 4, 4],
        <int>[5, 5, 5, 4, 2],
      ],
      shotsPerEnd: 5,
      highestScore: 6,
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
