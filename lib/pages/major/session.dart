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
  int _currentSheetID = -1;

  @override
  Widget build(BuildContext context) {
    if (_currentSheetID == -1) {
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
                _currentSheetID =
                    ScoreHandler.createScoresheet(Target.nfaa, 20);
              });
              ScoreHandler.scoresheets[_currentSheetID].ends
                  .add([5, 4, 4, 4, 3]);
              ScoreHandler.scoresheets[_currentSheetID].ends
                  .add([6, 6, 5, 5, 5, 0]);
            }),
      );
    } else {
      return Scaffold(
        appBar: const CustomAppBar(pageName: 'Session'),
        backgroundColor: Colors.white,
        body: Center(
          child: ListView.builder(
            itemCount: ScoreHandler.scoresheets[_currentSheetID].ends.length,
            itemBuilder: (BuildContext verticalContext, int endIndex) {
              return SizedBox(
                height: 40,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: ScoreHandler
                      .scoresheets[_currentSheetID].ends[endIndex].length,
                  itemBuilder: (BuildContext horizontalContext, int shotIndex) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(colors: [
                              TargetHandler.getRingColor(
                                  ScoreHandler
                                      .scoresheets[_currentSheetID].target,
                                  ScoreHandler.scoresheets[_currentSheetID]
                                      .ends[endIndex][shotIndex]),
                              Color.fromARGB(
                                  255,
                                  TargetHandler.getRingColor(
                                              ScoreHandler
                                                  .scoresheets[_currentSheetID]
                                                  .target,
                                              ScoreHandler
                                                  .scoresheets[_currentSheetID]
                                                  .ends[endIndex][shotIndex])
                                          .red -
                                      25,
                                  TargetHandler.getRingColor(
                                              ScoreHandler
                                                  .scoresheets[_currentSheetID]
                                                  .target,
                                              ScoreHandler
                                                  .scoresheets[_currentSheetID]
                                                  .ends[endIndex][shotIndex])
                                          .green -
                                      25,
                                  TargetHandler.getRingColor(
                                              ScoreHandler
                                                  .scoresheets[_currentSheetID]
                                                  .target,
                                              ScoreHandler
                                                  .scoresheets[_currentSheetID]
                                                  .ends[endIndex][shotIndex])
                                          .blue -
                                      25)
                            ])),
                        child: Center(
                          child: Text(TargetHandler.parseScore(
                              ScoreHandler.scoresheets[_currentSheetID].target,
                              ScoreHandler.scoresheets[_currentSheetID]
                                  .ends[endIndex][shotIndex])),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
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
