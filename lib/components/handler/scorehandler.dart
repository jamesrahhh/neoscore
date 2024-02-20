import 'package:neuralflight/components/handler/targethandler.dart';
import 'package:neuralflight/components/object/scoresheet.dart';

class ScoreHandler {
  static List<Scoresheet> scoresheets = [];

  static int createScoresheet(Target target, int distance) {
    scoresheets.add(Scoresheet(target: target, distance: distance));
    return scoresheets.length - 1;
  }
}
