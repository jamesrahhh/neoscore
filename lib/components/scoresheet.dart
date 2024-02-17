class Scoresheet {
  final Target target;
  final int distance;
  List<End> ends = [];

  Scoresheet({required this.target, required this.distance});
}

class End {
  final List<int> scores;

  End({required this.scores});
}

enum Target { nfaa, usa }
