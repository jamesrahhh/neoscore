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
  List<List<int>> scoreData = [
    [0],
    [0],
    [0, 0]
  ];

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
                  .add([4, 4, 4, 4, 3]);
              ScoreHandler.scoresheets[currentSheetID].ends
                  .add([6, 6, 5, 5, 5, 0]);
              setState(() {
                scoreData = ScoreHandler.refreshScoreData(currentSheetID);
              });
            }),
      );
    } else {
      return Scaffold(
          appBar: const CustomAppBar(pageName: 'Session'),
          backgroundColor: Colors.white,
          body: Center(
              child: Column(children: [
            // Header display.
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Scoresheet',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      '${ScoreHandler.scoresheets[currentSheetID].target.name.toUpperCase()} target, ${ScoreHandler.scoresheets[currentSheetID].distance} yards'),
                )
              ],
            ),
            // Score column info.
            const Padding(
              padding: EdgeInsets.all(4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'End',
                    style: TextStyle(fontSize: 13),
                  ),
                  Text('Xs  Scr  Run', style: TextStyle(fontSize: 13))
                ],
              ),
            ),
            // Score display.
            Flexible(
                child: ListView.builder(
              itemCount: ScoreHandler.scoresheets[currentSheetID].ends.length,
              itemBuilder: (BuildContext verticalContext, int endIndex) {
                return SizedBox(
                  height: 40,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 30,
                        child: Center(
                          child: Text(
                            '${endIndex + 1}',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                shadows: [
                                  Shadow(
                                    color: Color.fromARGB(255, 225, 225, 225),
                                    blurRadius: 20.0,
                                  )
                                ]),
                          ),
                        ),
                      ),
                      Flexible(
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: ScoreHandler.scoresheets[currentSheetID]
                              .ends[endIndex].length,
                          itemBuilder:
                              (BuildContext horizontalContext, int shotIndex) {
                            double screenWidth =
                                MediaQuery.of(context).size.width;
                            return SizedBox(
                              width: (screenWidth - 110) /
                                  (ScoreHandler.scoresheets[currentSheetID]
                                      .ends[endIndex].length),
                              child: Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Color.fromARGB(
                                              255, 225, 225, 225),
                                          blurRadius: 20.0,
                                        )
                                      ],
                                      gradient: LinearGradient(colors: [
                                        TargetHandler.getRingColors(
                                            ScoreHandler
                                                .scoresheets[currentSheetID]
                                                .target,
                                            ScoreHandler
                                                .scoresheets[currentSheetID]
                                                .ends[endIndex][shotIndex])[0],
                                        TargetHandler.getRingColors(
                                            ScoreHandler
                                                .scoresheets[currentSheetID]
                                                .target,
                                            ScoreHandler
                                                .scoresheets[currentSheetID]
                                                .ends[endIndex][shotIndex])[1]
                                      ])),
                                  child: Center(
                                    child: Text(
                                      TargetHandler.parseScore(
                                          ScoreHandler
                                              .scoresheets[currentSheetID]
                                              .target,
                                          ScoreHandler
                                              .scoresheets[currentSheetID]
                                              .ends[endIndex][shotIndex]),
                                      style: TextStyle(
                                          color:
                                              TargetHandler.getRingColors(
                                                  ScoreHandler
                                                      .scoresheets[
                                                          currentSheetID]
                                                      .target,
                                                  ScoreHandler
                                                          .scoresheets[
                                                              currentSheetID]
                                                          .ends[endIndex]
                                                      [shotIndex])[2]),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        width: 20,
                        child: Center(
                          child: Text(
                            '${scoreData[1][endIndex] - (endIndex == 0 ? 0 : scoreData[1][endIndex - 1])}',
                            style: const TextStyle(shadows: [
                              Shadow(
                                color: Color.fromARGB(255, 225, 225, 225),
                                blurRadius: 20.0,
                              )
                            ]),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 30,
                        child: Center(
                          child: Text(
                            '${scoreData[0][endIndex] - (endIndex == 0 ? 0 : scoreData[0][endIndex - 1])}',
                            style: const TextStyle(shadows: [
                              Shadow(
                                color: Color.fromARGB(255, 225, 225, 225),
                                blurRadius: 20.0,
                              )
                            ]),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 30,
                        child: Center(
                          child: Text(
                            '${scoreData[0][endIndex]}',
                            style: const TextStyle(shadows: [
                              Shadow(
                                color: Color.fromARGB(255, 225, 225, 225),
                                blurRadius: 20.0,
                              )
                            ]),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            )),
            // Score display.
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:
                      Text('Score: ${scoreData[2][0]}, X: ${scoreData[2][1]}'),
                ),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.save_rounded))
              ],
            )
          ])));
    }
  }
}
