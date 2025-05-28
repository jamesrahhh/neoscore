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
  });

  factory Scoresheet.fromMap({required Map<String, Object?> map}) {
    return Scoresheet(
      id: int.tryParse(map['id'].toString()) ?? 0,
      name: map['name'].toString(),
      ends: int.tryParse(map['ends'].toString()) ?? 0,
      shotsPerEnd: int.tryParse(map['shotsPerEnd'].toString()) ?? 0,
      target: Target.fromName(map['target'].toString()),
      arrows:
          (jsonDecode(map['arrows'].toString()) as List<dynamic>)
              .map<List<int>>(
                (dynamic end) => List<int>.from(end as List<dynamic>),
              )
              .toList(),
    );
  }

  int id;
  String name;
  Target target;
  int shotsPerEnd;
  int ends;
  List<List<int>> arrows;

  static Map<String, Object?> toMap({required Scoresheet scoresheet}) =>
      <String, Object?>{
        'id': scoresheet.id,
        'name': scoresheet.name,
        'ends': scoresheet.ends.toString(),
        'shotsPerEnd': scoresheet.shotsPerEnd.toString(),
        'arrows': jsonEncode(scoresheet.arrows),
        'target': scoresheet.target.name,
      };
}
