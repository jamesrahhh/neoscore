class Scoresheet {
  final Target target;
  final int distance;
  List<List<int>> ends = [];

  Scoresheet({required this.target, required this.distance});
}

enum Target { nfaa, usa }
