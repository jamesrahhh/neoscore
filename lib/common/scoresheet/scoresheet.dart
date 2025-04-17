import '../target/target.dart';

class Scoresheet {
  Scoresheet({
    required this.name,
    required this.target,
    required this.shotsPerEnd,
    required this.ends,
    required this.scoreData,
  });

  String name;
  Target target;
  int shotsPerEnd;
  int ends;
  List<List<int>> scoreData;
}
