import 'package:sqflite/sqflite.dart';

import '../../common/scoresheet/scoresheet.dart';
import '../../common/scoresheet/scoresheet_card.dart';
import '../../common/target/target.dart';

class SqfliteModel {
  late final Database _database;

  Future<void> init() async {
    _database = await openDatabase(
      'neoscore.db',
      version: 1,
      onCreate: (Database database, _) async {
        await database.execute(
          'CREATE TABLE scoresheets (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, ends INTEGER, shotsPerEnd INTEGER)',
        );
      },
    );
  }

  Future<List<ScoresheetCard>> queryCards({
    required int offset,
    required int limit,
  }) async {
    final List<Map<String, Object?>> rows = await _database.query(
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

  Future<Scoresheet> createScoresheet({
    required String name,
    required Target target,
    required int ends,
    required int shotsPerEnd,
  }) async {
    return Scoresheet(
      id: await _database.insert('scoresheets', <String, Object?>{
        'name': name,
        'ends': ends,
        'shotsPerEnd': shotsPerEnd,
      }),
      name: name,
      target: target,
      ends: ends,
      shotsPerEnd: shotsPerEnd,
    );
  }

  Future<void> updateScoresheet({required Scoresheet scoresheet}) async {
    //implement
  }

  Future<void> deleteScoresheet({required int id}) async {
    await _database.delete(
      'scoresheets',
      where: 'id = ?',
      whereArgs: <int>[id],
    );
  }

  Future<void> close() async {
    await _database.close();
  }
}
