import 'package:neuralflight/components/scoresheet.dart';

class Global {
  static List<Scoresheet> scoresheets = [];

  static int createScoresheet(Target target, int distance) {
    scoresheets.add(Scoresheet(target: target, distance: distance));
    return scoresheets.length;
  }
}
