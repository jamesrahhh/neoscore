import 'package:flutter/material.dart';
import 'package:neuralflight/components/model/scorehandler.dart';
import 'package:neuralflight/components/model/targethandler.dart';
import 'package:neuralflight/components/widget/scorekeyboard.dart';
import 'package:neuralflight/components/widget/customdrawer.dart';
import 'package:neuralflight/components/widget/scoresheetbuttons.dart';

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

  void refreshSessionState() {
    setState(() {
      scoreData = ScoreHandler.refreshScoreData(currentSheetID);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (currentSheetID == -1) {
      return Scaffold(
        appBar: AppBar(
            title: const Text('Session',
                style: TextStyle(fontWeight: FontWeight.bold))),
        backgroundColor: Colors.white,
        body: const Center(
          child: Text('No active session'),
        ),
        drawer: const CustomDrawer(),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add_rounded),
            onPressed: () {
              currentSheetID = ScoreHandler.createScoresheet(0, 20);
              setState(() {
                scoreData = ScoreHandler.refreshScoreData(currentSheetID);
              });
            }),
      );
    } else {
      return Scaffold(
          drawer: const CustomDrawer(),
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Scoresheet',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                      '${TargetHandler.targets[ScoreHandler.scoresheets[currentSheetID].targetIndex].name} target, ${ScoreHandler.scoresheets[currentSheetID].distance} yards',
                      style: const TextStyle(fontSize: 14)),
                ),
              ],
            ),
          ),
          backgroundColor: Colors.white,
          body: Center(
              child: Column(children: [
            const Padding(
              padding: EdgeInsets.all(4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'End',
                    style: TextStyle(fontSize: 13),
                  ),
                  Text('X   Scr', style: TextStyle(fontSize: 13))
                ],
              ),
            ),
            Flexible(
                child: ListView.builder(
              itemCount:
                  ScoreHandler.scoresheets[currentSheetID].ends.length + 1,
              itemBuilder: (BuildContext verticalContext, int endIndex) {
                if (endIndex ==
                    ScoreHandler.scoresheets[currentSheetID].ends.length) {
                  return SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        AddEndButton(
                          currentSheetID: currentSheetID,
                          update: refreshSessionState,
                        ),
                        SizedBox(
                            width: 20,
                            child: Center(child: Text('${scoreData[2][1]}'))),
                        SizedBox(
                            width: 30,
                            child: Center(child: Text('${scoreData[2][0]}'))),
                      ],
                    ),
                  );
                } else {
                  return SizedBox(
                    height: 40,
                    child: GestureDetector(
                      onHorizontalDragEnd: (details) {
                        if (details.primaryVelocity! < -5) {
                          Scaffold.of(verticalContext)
                              .showBottomSheet((BuildContext context) {
                            return ScoreKeyboard(
                              update: refreshSessionState,
                              currentSheetID: currentSheetID,
                              endIndex: endIndex,
                              shotIndex: ScoreHandler
                                  .scoresheets[currentSheetID]
                                  .ends[endIndex]
                                  .length,
                            );
                          });
                        }
                      },
                      child: Row(
                        children: [
                          SizedBox(
                            width: 30,
                            child: Center(
                              child: Text(
                                '${endIndex + 1}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: ScoreHandler
                                  .scoresheets[currentSheetID]
                                  .ends[endIndex]
                                  .length,
                              itemBuilder: (BuildContext horizontalContext,
                                  int shotIndex) {
                                double screenWidth =
                                    MediaQuery.of(context).size.width;
                                return InkWell(
                                  onTap: () {
                                    Scaffold.of(horizontalContext)
                                        .showBottomSheet(
                                            (BuildContext context) {
                                      return ScoreKeyboard(
                                        update: refreshSessionState,
                                        currentSheetID: currentSheetID,
                                        endIndex: endIndex,
                                        shotIndex: shotIndex,
                                      );
                                    });
                                  },
                                  child: SizedBox(
                                    width: (screenWidth - 80) /
                                        (ScoreHandler
                                            .scoresheets[currentSheetID]
                                            .ends[endIndex]
                                            .length),
                                    child: Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            gradient: TargetHandler
                                                .targets[ScoreHandler
                                                    .scoresheets[currentSheetID]
                                                    .targetIndex]
                                                .getRingGradient(
                                                    ScoreHandler
                                                            .scoresheets[
                                                                currentSheetID]
                                                            .ends[endIndex]
                                                        [shotIndex])),
                                        child: Center(
                                          child: Text(
                                            TargetHandler.parseScore(
                                                ScoreHandler
                                                    .scoresheets[currentSheetID]
                                                    .targetIndex,
                                                ScoreHandler
                                                    .scoresheets[currentSheetID]
                                                    .ends[endIndex][shotIndex]),
                                            style: TextStyle(
                                                color: TargetHandler.targets[
                                                        ScoreHandler
                                                            .scoresheets[
                                                                currentSheetID]
                                                            .targetIndex]
                                                    .getTextColor(ScoreHandler
                                                            .scoresheets[
                                                                currentSheetID]
                                                            .ends[endIndex]
                                                        [shotIndex])),
                                          ),
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
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 30,
                            child: Center(
                              child: Text(
                                '${scoreData[0][endIndex] - (endIndex == 0 ? 0 : scoreData[0][endIndex - 1])}',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
              },
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text('Save Scoresheet'),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.save_rounded)),
              ],
            ),
          ])));
    }
  }
}
