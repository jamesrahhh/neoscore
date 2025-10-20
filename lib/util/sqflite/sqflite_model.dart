import 'package:sqflite/sqflite.dart';

import '../../common/scoresheet/scoresheet.dart';
import '../../common/target/target.dart';

class SqfliteModel {
  late final Database _database;

  Future<void> init() async {
    _database = await openDatabase(
      'neoscore.db',
      version: 1,
      onCreate: (Database database, _) async {
        await database.execute(
          'CREATE TABLE scoresheets ( '
          'id INTEGER PRIMARY KEY AUTOINCREMENT, '
          'name TEXT NOT NULL, '
          'ends INTEGER NOT NULL, '
          'shotsPerEnd INTEGER NOT NULL, '
          'target TEXT NOT NULL, '
          'arrows TEXT NOT NULL, '
          'createdAt TEXT NOT NULL, '
          'updatedAt TEXT NOT NULL '
          ')',
        );
      },
    );
  }

  Future<List<Scoresheet>> queryCards({
    required int offset,
    required int limit,
  }) async =>
      (await _database.query(
        'scoresheets',
        offset: offset,
        limit: limit,
        orderBy: 'id DESC',
      ))
          .map((Map<String, Object?> row) => Scoresheet.fromMap(map: row))
          .toList();

  Future<Scoresheet> queryScoresheet({required int id}) async => Scoresheet.fromMap(
        map: (await _database.query(
          'scoresheets',
          where: 'id = ?',
          whereArgs: <int>[id],
        ))[0],
      );

  Future<Scoresheet> createScoresheet({
    required String name,
    required Target target,
    required int ends,
    required int shotsPerEnd,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) async =>
      Scoresheet(
        id: await _database.insert('scoresheets', <String, Object?>{
          'name': name,
          'ends': ends,
          'shotsPerEnd': shotsPerEnd,
          'target': target.name,
          'arrows': '[[]]',
          'createdAt': createdAt.toIso8601String(),
          'updatedAt': updatedAt.toIso8601String(),
        }),
        name: name,
        target: target,
        ends: ends,
        shotsPerEnd: shotsPerEnd,
        arrows: <List<int>>[],
        createdAt: createdAt,
        updatedAt: updatedAt,
      );

  Future<Scoresheet> updateScoresheet({required Scoresheet scoresheet}) async {
    final Scoresheet updatedScoresheet = scoresheet.copyWith(updatedAt: DateTime.now());
    await _database.update(
      'scoresheets',
      Scoresheet.toMap(scoresheet: updatedScoresheet),
      where: 'id = ?',
      whereArgs: <int>[scoresheet.id],
    );
    return updatedScoresheet;
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
