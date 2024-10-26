class Scoresheet {
  Scoresheet(
      {required this.scoreData,
      required this.shotsPerEnd,
      required this.highestScore});

  List<List<int>> scoreData;
  int shotsPerEnd;
  int highestScore;

  int get getTotalScore {
    int total = 0;
    for (final List<int> end in scoreData) {
      for (final int shot in end) {
        total += shot;
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
}
