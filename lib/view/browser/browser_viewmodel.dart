import 'package:flutter/material.dart';

import '../../common/scoresheet/scoresheet.dart';
import '../../common/scoresheet/scoresheet_card.dart';
import '../../common/target/target.dart';
import '../../util/database/sqflite_model.dart';

class BrowserViewModel extends ChangeNotifier {
  BrowserViewModel() {
    _init();
  }

  final SqfliteModel _sqfliteModel = SqfliteModel();
  bool _hasMore = true;
  bool _isLoading = false;
  List<ScoresheetCard> _cards = <ScoresheetCard>[];

  List<ScoresheetCard> get scoresheetCards => _cards;
  bool get hasMore => _hasMore;

  Future<void> _init() async {
    await _sqfliteModel.init();
    await queryCardsInit();
  }

  Future<void> queryCardsInit() async {
    _cards = <ScoresheetCard>[];
    _hasMore = true;
    await queryCards();
  }

  Future<void> queryCards() async {
    if (!_hasMore || _isLoading) {
      return;
    }
    _isLoading = true;

    final List<ScoresheetCard> newCards = await _sqfliteModel.queryCards(
      offset: _cards.length,
      limit: 10,
    );
    _cards.addAll(newCards);
    _hasMore = newCards.length == 10;
    _isLoading = false;

    notifyListeners();
  }

  Future<void> queryScoresheet() async {}

  Future<Scoresheet> createScoresheet({
    required String name,
    required Target target,
    required int ends,
    required int shotsPerEnd,
  }) async {
    final Scoresheet scoresheet = await _sqfliteModel.createScoresheet(
      name: name,
      target: target,
      ends: ends,
      shotsPerEnd: shotsPerEnd,
    );
    await queryCardsInit();
    return scoresheet;
  }

  Future<void> updateScoresheet({
    required Scoresheet scoresheet,
    required int id,
  }) async {
    await _sqfliteModel.updateScoresheet(scoresheet: scoresheet);
  }

  Future<void> deleteScoresheet({required int id}) async {
    await _sqfliteModel.deleteScoresheet(id: id);
    _cards.removeWhere((ScoresheetCard card) => card.id == id);
    notifyListeners();
  }

  @override
  void dispose() {
    _sqfliteModel.close();
    super.dispose();
  }
}
