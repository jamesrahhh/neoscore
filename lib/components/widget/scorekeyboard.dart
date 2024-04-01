import 'package:flutter/material.dart';
import 'package:neuralflight/components/model/scorehandler.dart';
import 'package:neuralflight/components/model/targethandler.dart';

/// Bottom sheet widget that serves as a custom keyboard for entering scores.
class ScoreKeyboard extends StatelessWidget {
  const ScoreKeyboard(
      {super.key,
      required this.update,
      required this.currentSheetID,
      required this.endIndex,
      required this.shotIndex});

  final int currentSheetID;
  final int endIndex;
  final int shotIndex;
  final Function() update;

  @override
  Widget build(BuildContext context) {
    double rowMembers = ((TargetHandler
                .targets[ScoreHandler.scoresheets[currentSheetID].targetIndex]
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
                          .scoresheets[currentSheetID].ends.isNotEmpty) {
                        if (ScoreHandler.scoresheets[currentSheetID]
                            .ends[endIndex].isNotEmpty) {
                          ScoreHandler
                              .scoresheets[currentSheetID].ends[endIndex]
                              .removeAt(shotIndex);
                          if (ScoreHandler.scoresheets[currentSheetID]
                              .ends[endIndex].isEmpty) {
                            ScoreHandler.scoresheets[currentSheetID].ends
                                .removeAt(endIndex);
                          }
                        }
                      }
                      update();
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
                        child: Flexible(
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: verticalIndex == 0
                                  ? rowMembers.ceil()
                                  : rowMembers.floor(),
                              itemBuilder:
                                  (horizontalContext, horizontalIndex) {
                                return InkWell(
                                  onTap: () {
                                    if (ScoreHandler.scoresheets[currentSheetID]
                                            .ends.length <=
                                        endIndex) {
                                      ScoreHandler
                                          .scoresheets[currentSheetID].ends
                                          .add([]);
                                    }
                                    if (ScoreHandler.scoresheets[currentSheetID]
                                            .ends[endIndex].length <=
                                        shotIndex) {
                                      ScoreHandler.scoresheets[currentSheetID]
                                          .ends[endIndex]
                                          .add(0);
                                    }
                                    ScoreHandler.scoresheets[currentSheetID]
                                            .ends[endIndex][shotIndex] =
                                        horizontalIndex +
                                            (verticalIndex == 0
                                                ? 0
                                                : rowMembers.ceil());
                                    ScoreHandler.scoresheets[currentSheetID]
                                        .ends[endIndex]
                                        .sort((b, a) => a.compareTo(b));
                                    update();
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
                                                    .scoresheets[currentSheetID]
                                                    .targetIndex]
                                                .getRingGradient(
                                                    horizontalIndex +
                                                        (verticalIndex == 0
                                                            ? 0
                                                            : rowMembers
                                                                .ceil()))),
                                        child: Center(
                                            child: Text(
                                                TargetHandler.parseScore(
                                                    ScoreHandler
                                                        .scoresheets[
                                                            currentSheetID]
                                                        .targetIndex,
                                                    horizontalIndex +
                                                        (verticalIndex == 0
                                                            ? 0
                                                            : rowMembers
                                                                .ceil())),
                                                style: TextStyle(
                                                    color: TargetHandler
                                                        .targets[ScoreHandler
                                                            .scoresheets[
                                                                currentSheetID]
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
                      ),
                    );
                  }),
            ),
          ],
        ));
  }
}
