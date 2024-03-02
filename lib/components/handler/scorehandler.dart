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

  /// Gathers totals for a scoresheet.
  ///
  /// Takes [currentSheetID], the index of the scoresheet within scoresheets[],
  /// and returns a list containing a list of the running totals,
  /// a list of the running Xs, and a list with the total score and the total Xs.
  static List<List<int>> refreshScoreData(int currentSheetID) {
    List<int> runningTotals = [];
    List<int> runningXs = [];
    int total = 0;
    int x = 0;

    for (int i = 0; i < scoresheets[currentSheetID].ends.length; i++) {
      for (int j = 0; j < scoresheets[currentSheetID].ends[i].length; j++) {
        total += scoresheets[currentSheetID].ends[i][j];
        if (TargetHandler.parseScore(scoresheets[currentSheetID].target,
                scoresheets[currentSheetID].ends[i][j]) ==
            'X') {
          total--;
          x++;
        }
      }
      runningTotals.add(total);
      runningXs.add(x);
    }

    return [
      runningTotals,
      runningXs,
      [total, x]
    ];
  }
}
