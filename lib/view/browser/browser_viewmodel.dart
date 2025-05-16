import 'package:flutter/material.dart';

import '../../common/scoresheet/scoresheet.dart';
import '../../common/scoresheet/scoresheet_card.dart';
import '../../util/database/sqflite_model.dart';

class BrowserViewModel extends ChangeNotifier {
  BrowserViewModel() {
    _init();
  }

  final SqfliteModel _sqfliteModel = SqfliteModel();
  final int _pageSize = 5;
  int _currentOffset = 0;
  bool _hasMore = true;
  List<ScoresheetCard> _scoresheetCards = <ScoresheetCard>[];

  List<ScoresheetCard> get scoresheetCards => _scoresheetCards;
  bool get hasMore => _hasMore;

  Future<void> _init() async {
    await _sqfliteModel.init();
    await queryCardsInit();
  }

  Future<void> queryCardsInit() async {
    _scoresheetCards = <ScoresheetCard>[];
    _currentOffset = 0;
    _hasMore = true;
    await queryCards();
  }

  Future<void> queryCards() async {
    if (!_hasMore) {
      return;
    }

    final List<ScoresheetCard> newCards = await _sqfliteModel.queryCards(
      offset: _currentOffset,
      limit: _pageSize,
    );
    _scoresheetCards.addAll(newCards);
    _currentOffset += newCards.length;
    _hasMore = newCards.length == _pageSize;

    notifyListeners();
  }

  Future<void> queryScoresheet() async {}

  Future<int> insertScoresheet({required Scoresheet scoresheet}) async {
    final int id = await _sqfliteModel.insertScoresheet(scoresheet: scoresheet);
    await queryCardsInit();
    return id;
  }

  Future<void> updateScoresheet({
    required Scoresheet scoresheet,
    required int id,
  }) async {
    await _sqfliteModel.updateScoresheet(scoresheet: scoresheet, id: id);
    await queryCardsInit();
  }

  Future<void> deleteScoresheet({required int id}) async {
    await _sqfliteModel.deleteScoresheet(id: id);
  }

  @override
  void dispose() {
    _sqfliteModel.close();
    super.dispose();
  }
}
