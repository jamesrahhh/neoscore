import 'dart:convert';

import '../target/target.dart';
import 'scoresheet_card.dart';

class Scoresheet extends ScoresheetCard {
  Scoresheet({
    required super.id,
    required super.name,
    required super.target,
    required super.shotsPerEnd,
    required super.ends,
    required this.arrows,
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
      );

  List<List<int>> arrows;

  static Map<String, Object?> toMap({required Scoresheet scoresheet}) => <String, Object?>{
        'id': scoresheet.id,
        'name': scoresheet.name,
        'ends': scoresheet.ends.toString(),
        'shotsPerEnd': scoresheet.shotsPerEnd.toString(),
        'arrows': jsonEncode(scoresheet.arrows),
        'target': scoresheet.target.name,
      };

  Scoresheet copyWith({
    int? id,
    String? name,
    Target? target,
    int? shotsPerEnd,
    int? ends,
    List<List<int>>? arrows,
  }) =>
      Scoresheet(
        id: id ?? this.id,
        name: name ?? this.name,
        target: target ?? this.target,
        shotsPerEnd: shotsPerEnd ?? this.shotsPerEnd,
        ends: ends ?? this.ends,
        arrows: arrows ?? this.arrows,
      );
}
