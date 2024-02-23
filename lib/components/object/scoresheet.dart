import 'package:neuralflight/components/handler/targethandler.dart';

/// Scoresheet object.
///
/// Takes [target] and [distance].
class Scoresheet {
  final Target target;
  final int distance;
  List<List<int>> ends = [];

  Scoresheet({required this.target, required this.distance});
}
