import '../target/target.dart';

class Scoresheet {
  Scoresheet({
    required this.name,
    required this.target,
    required this.shotsPerEnd,
    required this.ends,
  }) : scoreData = List<List<int>>.generate(ends, (_) => <int>[]);

  String name;
  Target target;
  int shotsPerEnd;
  int ends;
  List<List<int>> scoreData;

  static Map<String, Object?> toMap({required Scoresheet scoresheet}) =>
      <String, Object?>{
        'name': scoresheet.name,
        'ends': scoresheet.ends.toString(),
        'shotsPerEnd': scoresheet.shotsPerEnd.toString(),
      };
}
