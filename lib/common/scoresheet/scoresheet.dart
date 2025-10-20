import 'dart:convert';

import '../target/target.dart';

class Scoresheet {
  Scoresheet({
    required this.id,
    required this.name,
    required this.target,
    required this.shotsPerEnd,
    required this.ends,
    required this.arrows,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Scoresheet.fromMap({required Map<String, Object?> map}) => Scoresheet(
        id: int.tryParse(map['id'].toString()) ?? 0,
        name: map['name'].toString(),
        ends: int.tryParse(map['ends'].toString()) ?? 0,
        shotsPerEnd: int.tryParse(map['shotsPerEnd'].toString()) ?? 0,
        target: Target.fromName(map['target'].toString()),
        arrows: (jsonDecode(map['arrows'].toString()) as List<dynamic>)
            .map<List<int>>(
              (dynamic end) => List<int>.from(end as List<dynamic>),
            )
            .toList(),
        createdAt: _parseDateTime(map['createdAt']),
        updatedAt: _parseDateTime(map['updatedAt']),
      );

  final int id;
  final String name;
  final Target target;
  final int shotsPerEnd;
  final int ends;
  List<List<int>> arrows;
  final DateTime createdAt;
  DateTime updatedAt;

  static DateTime _parseDateTime(Object? dateTime) {
    final String? dateTimeFormatted = dateTime?.toString();

    if (dateTimeFormatted == null || dateTimeFormatted.isEmpty) {
      return DateTime.fromMillisecondsSinceEpoch(0);
    }

    return DateTime.tryParse(dateTimeFormatted) ?? DateTime.fromMillisecondsSinceEpoch(0);
  }

  static Map<String, Object?> toMap({required Scoresheet scoresheet}) => <String, Object?>{
        'id': scoresheet.id,
        'name': scoresheet.name,
        'ends': scoresheet.ends.toString(),
        'shotsPerEnd': scoresheet.shotsPerEnd.toString(),
        'arrows': jsonEncode(scoresheet.arrows),
        'target': scoresheet.target.name,
        'createdAt': scoresheet.createdAt.toIso8601String(),
        'updatedAt': scoresheet.updatedAt.toIso8601String(),
      };

  Scoresheet copyWith({
    int? id,
    String? name,
    Target? target,
    int? shotsPerEnd,
    int? ends,
    List<List<int>>? arrows,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      Scoresheet(
        id: id ?? this.id,
        name: name ?? this.name,
        target: target ?? this.target,
        shotsPerEnd: shotsPerEnd ?? this.shotsPerEnd,
        ends: ends ?? this.ends,
        arrows: arrows ?? this.arrows,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
}
