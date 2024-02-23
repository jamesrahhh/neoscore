import 'package:flutter/material.dart';
import 'package:neuralflight/components/widget/customappbar.dart';
import 'package:neuralflight/components/handler/scorehandler.dart';
import 'package:neuralflight/components/handler/targethandler.dart';

class Session extends StatefulWidget {
  const Session({super.key});

  @override
  State<Session> createState() => _SessionState();
}

class _SessionState extends State<Session> {
  int currentSheetID = -1;

  @override
  Widget build(BuildContext context) {
    if (currentSheetID == -1) {
      return Scaffold(
        appBar: const CustomAppBar(pageName: 'Session'),
        backgroundColor: Colors.white,
        body: const Center(
          child: Text('No active session'),
        ),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add_rounded),
            onPressed: () {
              setState(() {
                currentSheetID = ScoreHandler.createScoresheet(Target.nfaa, 20);
              });
              ScoreHandler.scoresheets[currentSheetID].ends
                  .add([5, 4, 4, 4, 3]);
              ScoreHandler.scoresheets[currentSheetID].ends
                  .add([6, 6, 5, 5, 5, 0]);
            }),
      );
    } else {
      return Scaffold(
        appBar: const CustomAppBar(pageName: 'Session'),
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            children: [
              SessionInfoDisplay(currentSheetID: currentSheetID),
              SessionScoresheetDisplay(currentSheetID: currentSheetID)
            ],
          ),
        ), /*
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add_rounded),
            onPressed: () {
              setState(() {
                _currentSheetID =
                    ScoreHandler.createScoresheet(Target.nfaa, 20);
              });
              ScoreHandler.scoresheets[_currentSheetID].ends
                  .add([5, 4, 4, 4, 3]);
              ScoreHandler.scoresheets[_currentSheetID].ends
                  .add([6, 6, 5, 5, 5]);
            }),*/
      );
    }
  }
}

class SessionInfoDisplay extends StatelessWidget {
  final int currentSheetID;

  const SessionInfoDisplay({super.key, required this.currentSheetID});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Scoresheet',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
              '${ScoreHandler.scoresheets[currentSheetID].target.name.toUpperCase()} target, ${ScoreHandler.scoresheets[currentSheetID].distance} yards'),
        )
      ],
    );
  }
}

class SessionScoresheetDisplay extends StatelessWidget {
  final int currentSheetID;

  const SessionScoresheetDisplay({super.key, required this.currentSheetID});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
        itemCount: ScoreHandler.scoresheets[currentSheetID].ends.length,
        itemBuilder: (BuildContext verticalContext, int endIndex) {
          return SizedBox(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 64,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text('End ${endIndex + 1}'),
                  ),
                ),
                Flexible(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: ScoreHandler
                        .scoresheets[currentSheetID].ends[endIndex].length,
                    itemBuilder:
                        (BuildContext horizontalContext, int shotIndex) {
                      double screenWidth = MediaQuery.of(context).size.width;
                      return SizedBox(
                        width: (screenWidth - 64) /
                            (ScoreHandler.scoresheets[currentSheetID]
                                .ends[endIndex].length),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(colors: [
                                  TargetHandler.getRingColors(
                                      ScoreHandler
                                          .scoresheets[currentSheetID].target,
                                      ScoreHandler.scoresheets[currentSheetID]
                                          .ends[endIndex][shotIndex])[0],
                                  TargetHandler.getRingColors(
                                      ScoreHandler
                                          .scoresheets[currentSheetID].target,
                                      ScoreHandler.scoresheets[currentSheetID]
                                          .ends[endIndex][shotIndex])[1]
                                ])),
                            child: Center(
                              child: Text(
                                TargetHandler.parseScore(
                                    ScoreHandler
                                        .scoresheets[currentSheetID].target,
                                    ScoreHandler.scoresheets[currentSheetID]
                                        .ends[endIndex][shotIndex]),
                                style: TextStyle(
                                    color: TargetHandler.getRingColors(
                                        ScoreHandler
                                            .scoresheets[currentSheetID].target,
                                        ScoreHandler.scoresheets[currentSheetID]
                                            .ends[endIndex][shotIndex])[2]),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class SessionBottomDisplay extends StatelessWidget {
  final int currentSheetID;

  const SessionBottomDisplay({super.key, required this.currentSheetID});

  @override
  Widget build(BuildContext context) {
    return Text('Score: ${ScoreHandler.getTotalScore(currentSheetID)}');
  }
}
