import 'package:flutter/material.dart';
import 'package:neoscore/components/scoresheet/scorehandler.dart';
import 'package:neoscore/components/target/targethandler.dart';

/// Bottom sheet widget that serves as a custom keyboard for entering scores.
class ScoreKeyboard extends StatelessWidget {
  const ScoreKeyboard(
      {super.key,
      required this.refreshState,
      required this.scoresheetIndex,
      required this.endIndex,
      required this.shotIndex});

  final int scoresheetIndex;
  final int endIndex;
  final int shotIndex;
  final Function() refreshState;

  @override
  Widget build(BuildContext context) {
    double rowMembers = ((TargetHandler
                .targets[ScoreHandler.scoresheets[scoresheetIndex].targetIndex]
                .maxScore +
            2) /
        2);
    double screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
        height: 175,
        width: screenWidth,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Edit score'),
                ),
                IconButton(
                    onPressed: () {
                      if (ScoreHandler
                          .scoresheets[scoresheetIndex].ends.isNotEmpty) {
                        if (ScoreHandler.scoresheets[scoresheetIndex]
                            .ends[endIndex].isNotEmpty) {
                          ScoreHandler
                              .scoresheets[scoresheetIndex].ends[endIndex]
                              .removeAt(shotIndex);
                          if (ScoreHandler.scoresheets[scoresheetIndex]
                              .ends[endIndex].isEmpty) {
                            ScoreHandler.scoresheets[scoresheetIndex].ends
                                .removeAt(endIndex);
                          }
                        }
                      }
                      refreshState();
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.delete_rounded))
              ],
            ),
            Flexible(
              child: ListView.builder(
                  itemCount: 2,
                  shrinkWrap: true,
                  itemBuilder: (verticalContext, verticalIndex) {
                    return Center(
                      child: SizedBox(
                        height: 60,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: verticalIndex == 0
                                ? rowMembers.ceil()
                                : rowMembers.floor(),
                            itemBuilder: (horizontalContext, horizontalIndex) {
                              return InkWell(
                                onTap: () {
                                  if (ScoreHandler.scoresheets[scoresheetIndex]
                                          .ends.length <=
                                      endIndex) {
                                    ScoreHandler
                                        .scoresheets[scoresheetIndex].ends
                                        .add([]);
                                  }
                                  if (ScoreHandler.scoresheets[scoresheetIndex]
                                          .ends[endIndex].length <=
                                      shotIndex) {
                                    ScoreHandler.scoresheets[scoresheetIndex]
                                        .ends[endIndex]
                                        .add(0);
                                  }
                                  ScoreHandler.scoresheets[scoresheetIndex]
                                          .ends[endIndex][shotIndex] =
                                      horizontalIndex +
                                          (verticalIndex == 0
                                              ? 0
                                              : rowMembers.ceil());
                                  ScoreHandler.scoresheets[scoresheetIndex]
                                      .ends[endIndex]
                                      .sort((b, a) => a.compareTo(b));
                                  refreshState();
                                  Navigator.pop(context);
                                },
                                child: SizedBox(
                                  width: (screenWidth - 30) /
                                      ((verticalIndex == 0
                                          ? rowMembers.ceil()
                                          : rowMembers.floor())),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          gradient: TargetHandler
                                              .targets[ScoreHandler
                                                  .scoresheets[scoresheetIndex]
                                                  .targetIndex]
                                              .getRingGradient(horizontalIndex +
                                                  (verticalIndex == 0
                                                      ? 0
                                                      : rowMembers.ceil()))),
                                      child: Center(
                                          child: Text(
                                              TargetHandler.parseScore(
                                                  ScoreHandler
                                                      .scoresheets[
                                                          scoresheetIndex]
                                                      .targetIndex,
                                                  horizontalIndex +
                                                      (verticalIndex == 0
                                                          ? 0
                                                          : rowMembers.ceil())),
                                              style: TextStyle(
                                                  color: TargetHandler
                                                      .targets[ScoreHandler
                                                          .scoresheets[
                                                              scoresheetIndex]
                                                          .targetIndex]
                                                      .getTextColor(
                                                          horizontalIndex +
                                                              (verticalIndex ==
                                                                      0
                                                                  ? 0
                                                                  : rowMembers
                                                                      .ceil()))))),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                    );
                  }),
            ),
          ],
        ));
  }
}
