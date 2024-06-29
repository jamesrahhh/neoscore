import 'package:neoscore/components/target/targethandler.dart';
import 'package:neoscore/components/scoresheet/scoresheet.dart';

class ScoreHandler {
  static List<Scoresheet> scoresheets = [];

  /// Creates a new scoresheet and returns its index.
  ///
  /// Takes [targetIndex] and [distance] as distance.
  static int createScoresheet(int targetIndex, int distance) {
    scoresheets.add(Scoresheet(targetIndex: targetIndex, distance: distance));
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
      for (int ii = 0; ii < scoresheets[currentSheetID].ends[i].length; ii++) {
        total += scoresheets[currentSheetID].ends[i][ii];
        if (TargetHandler.parseScore(scoresheets[currentSheetID].targetIndex,
                scoresheets[currentSheetID].ends[i][ii]) ==
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
