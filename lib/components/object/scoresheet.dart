/// Scoresheet object.
///
/// Takes [targetIndex], the index of the target within TargetHandler.targets[] and [distance].
class Scoresheet {
  Scoresheet({required this.targetIndex, required this.distance});

  final int distance;
  List<List<int>> ends = [];
  final int targetIndex;
}
