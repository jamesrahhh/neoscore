import '../target/target.dart';

class Scoresheet {
  Scoresheet({
    required this.id,
    required this.name,
    required this.target,
    required this.shotsPerEnd,
    required this.ends,
  }) : scoreData = List<List<int>>.generate(ends, (_) => <int>[]);

  int id;
  String name;
  Target target;
  int shotsPerEnd;
  int ends;
  List<List<int>> scoreData;

  static Map<String, Object?> toMap({required Scoresheet scoresheet}) =>
      <String, Object?>{
        'id': scoresheet.id,
        'name': scoresheet.name,
        'ends': scoresheet.ends.toString(),
        'shotsPerEnd': scoresheet.shotsPerEnd.toString(),
      };
}
