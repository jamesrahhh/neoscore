import 'package:flutter/material.dart';
import 'package:neuralflight/components/handler/scorehandler.dart';
import 'package:neuralflight/components/handler/targethandler.dart';

/// Bottom sheet widget that serves as a custom keyboard for entering scores.
class ScoreKeyboard extends StatelessWidget {
  final Function() update;
  final int currentSheetID;
  final int endIndex;
  final int shotIndex;

  const ScoreKeyboard(
      {super.key,
      required this.update,
      required this.currentSheetID,
      required this.endIndex,
      required this.shotIndex});

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
                      ScoreHandler.scoresheets[currentSheetID].ends[endIndex]
                          .removeAt(shotIndex);
                      if (ScoreHandler
                          .scoresheets[currentSheetID].ends[endIndex].isEmpty) {
                        ScoreHandler.scoresheets[currentSheetID].ends
                            .removeAt(endIndex);
                      }
                      update();
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.delete_rounded))
              ],
            ),
            Flexible(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: rowMembers.ceil(),
                  itemBuilder: (BuildContext horizontalContext, int index) {
                    return InkWell(
                      onTap: () {
                        ScoreHandler.scoresheets[currentSheetID].ends[endIndex]
                            [shotIndex] = index;
                        ScoreHandler.scoresheets[currentSheetID].ends[endIndex]
                            .sort((b, a) => a.compareTo(b));
                        update();
                        Navigator.pop(context);
                      },
                      child: SizedBox(
                        height: 60,
                        width: (screenWidth - 30) / (rowMembers.ceil()),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: TargetHandler.targets[ScoreHandler
                                        .scoresheets[currentSheetID]
                                        .targetIndex]
                                    .getRingGradient(index)),
                            child: Center(
                                child: Text(
                                    TargetHandler.parseScore(
                                        ScoreHandler.scoresheets[currentSheetID]
                                            .targetIndex,
                                        index),
                                    style: TextStyle(
                                        color: TargetHandler.targets[
                                                ScoreHandler
                                                    .scoresheets[currentSheetID]
                                                    .targetIndex]
                                            .getTextColor(index)))),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            Flexible(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: rowMembers.floor(),
                  itemBuilder: (BuildContext horizontalContext, int index) {
                    double screenWidth = MediaQuery.of(context).size.width;
                    return InkWell(
                      onTap: () {
                        ScoreHandler.scoresheets[currentSheetID].ends[endIndex]
                            [shotIndex] = index + rowMembers.ceil();
                        ScoreHandler.scoresheets[currentSheetID].ends[endIndex]
                            .sort((b, a) => a.compareTo(b));
                        update();
                        Navigator.pop(context);
                      },
                      child: SizedBox(
                        width: (screenWidth - 30) / (rowMembers.floor()),
                        height: 60,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: TargetHandler.targets[ScoreHandler
                                        .scoresheets[currentSheetID]
                                        .targetIndex]
                                    .getRingGradient(
                                        index + rowMembers.ceil())),
                            child: Center(
                                child: Text(
                                    TargetHandler.parseScore(
                                        ScoreHandler.scoresheets[currentSheetID]
                                            .targetIndex,
                                        index + rowMembers.ceil()),
                                    style: TextStyle(
                                        color: TargetHandler.targets[
                                                ScoreHandler
                                                    .scoresheets[currentSheetID]
                                                    .targetIndex]
                                            .getTextColor(
                                                index + rowMembers.ceil())))),
                          ),
                        ),
                      ),
                    );
                  }),
            )
          ],
        ));
  }
}
