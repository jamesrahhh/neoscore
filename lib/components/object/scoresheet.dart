/// Scoresheet object.
///
/// Takes [targetIndex], the index of the target within TargetHandler.targets[] and [distance].
class Scoresheet {
  final int targetIndex;
  final int distance;
  List<List<int>> ends = [];

  Scoresheet({required this.targetIndex, required this.distance});
}
