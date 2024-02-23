import 'package:neuralflight/components/handler/targethandler.dart';
import 'package:neuralflight/components/object/scoresheet.dart';

class ScoreHandler {
  static List<Scoresheet> scoresheets = [];

  /// Creates a new scoresheet and returns its index.
  ///
  /// Takes [target] and [distance] as distance.
  static int createScoresheet(Target target, int distance) {
    scoresheets.add(Scoresheet(target: target, distance: distance));
    return scoresheets.length - 1;
  }

  /// Calculates the total score of a scoresheet.
  ///
  /// Takes [target] and [currentSheetID], the index of the scoresheet within scoresheets[],
  /// and returns a list containing the total score and the amount of X's.
  static List<int> getTotalScore(Target target, int currentSheetID) {
    int total = 0;
    int x = 0;

    for (int i = 0; i < scoresheets[currentSheetID].ends.length; i++) {
      for (int j = 0; j < scoresheets[currentSheetID].ends[i].length; j++) {
        total += scoresheets[currentSheetID].ends[i][j];
        if (TargetHandler.parseScore(
                target, scoresheets[currentSheetID].ends[i][j]) ==
            'X') {
          total--;
          x++;
        }
      }
    }
    return [total, x];
  }
}
