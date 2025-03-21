import '../target/target.dart';

class Scoresheet {
  Scoresheet({
    required this.scoreData,
    required this.target,
    required this.shotsPerEnd,
    required this.ends,
  });

  List<List<int>> scoreData;
  Target target;
  int shotsPerEnd;
  int ends;

  int getTotalScoreEnd(int endIndex) {
    if (endIndex >= scoreData.length) {
      return 0;
    }
    int total = 0;
    for (final int shot in scoreData[endIndex]) {
      total += shot > target.highestScore ? target.highestScore : shot;
    }
    return total;
  }

  int getSingleScoreEnd(int endIndex, int score) {
    if (endIndex >= scoreData.length) {
      return 0;
    }
    int total = 0;
    for (final int shot in scoreData[endIndex]) {
      if (shot == score) {
        total++;
      }
    }
    return total;
  }

  int get getTotalScore {
    int total = 0;
    for (final List<int> end in scoreData) {
      for (final int shot in end) {
        total += shot > target.highestScore ? target.highestScore : shot;
      }
    }
    return total;
  }

  int getSingleScore(int score) {
    int total = 0;
    for (final List<int> end in scoreData) {
      for (final int shot in end) {
        if (shot == score) {
          total++;
        }
      }
    }
    return total;
  }

  int get getLastEnd {
    for (int endIndex = 0; endIndex < ends; endIndex++) {
      if (scoreData[endIndex].length < shotsPerEnd) {
        return endIndex;
      }
    }
    return ends - 1;
  }
}
