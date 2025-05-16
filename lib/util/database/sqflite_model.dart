import 'package:sqflite/sqflite.dart';

import '../../common/scoresheet/scoresheet.dart';
import '../../common/scoresheet/scoresheet_card.dart';

class SqfliteModel {
  late final Database _scoresheetsDatabase;

  Future<void> init() async {
    _scoresheetsDatabase = await openDatabase(
      'neoscore.db',
      version: 1,
      onCreate: (Database db, _) async {
        await db.execute(
          'CREATE TABLE scoresheets (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, ends INTEGER, shotsPerEnd INTEGER)',
        );
      },
    );
  }

  Future<List<ScoresheetCard>> queryCards({
    required int offset,
    required int limit,
  }) async {
    final List<Map<String, Object?>> rows = await _scoresheetsDatabase.query(
      'scoresheets',
      offset: offset,
      limit: limit,
      orderBy: 'id DESC',
    );
    return rows
        .map((Map<String, Object?> row) => ScoresheetCard.fromMap(map: row))
        .toList();
  }

  Future<void> queryScoresheet({required int id}) async {
    //implement
  }

  Future<int> insertScoresheet({required Scoresheet scoresheet}) async {
    return _scoresheetsDatabase.insert(
      'scoresheets',
      Scoresheet.toMap(scoresheet: scoresheet),
    );
  }

  Future<void> updateScoresheet({
    required Scoresheet scoresheet,
    required int id,
  }) async {
    //implement
  }

  Future<void> deleteScoresheet({required int id}) async {
    //implement
  }

  Future<void> close() async {
    await _scoresheetsDatabase.close();
  }
}
