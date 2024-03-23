import 'package:flutter/material.dart';
import 'package:neuralflight/components/handler/scorehandler.dart';
import 'package:neuralflight/components/handler/targethandler.dart';

/// Bottom sheet widget that serves as a custom keyboard for entering scores.
class CustomBottomSheet extends StatelessWidget {
  final Function(int, int, int) update;
  final int currentSheetID;
  final int endIndex;
  final int shotIndex;

  const CustomBottomSheet(
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
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Edit score'),
            ),
            SizedBox(
              height: 60,
              child: Flexible(
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: rowMembers.ceil(),
                    itemBuilder: (BuildContext horizontalContext, int index) {
                      return InkWell(
                        onTap: () {
                          update(endIndex, shotIndex, index);
                          Navigator.pop(context);
                        },
                        child: SizedBox(
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
                                          ScoreHandler
                                              .scoresheets[currentSheetID]
                                              .targetIndex,
                                          index),
                                      style: TextStyle(
                                          color: TargetHandler
                                              .targets[ScoreHandler
                                                  .scoresheets[currentSheetID]
                                                  .targetIndex]
                                              .getTextColor(index)))),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ),
            SizedBox(
              height: 60,
              child: Flexible(
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: rowMembers.floor(),
                    itemBuilder: (BuildContext horizontalContext, int index) {
                      double screenWidth = MediaQuery.of(context).size.width;
                      return InkWell(
                        onTap: () {
                          update(
                              endIndex, shotIndex, index + rowMembers.ceil());
                          Navigator.pop(context);
                        },
                        child: SizedBox(
                          width: (screenWidth - 30) / (rowMembers.floor()),
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
                                          ScoreHandler
                                              .scoresheets[currentSheetID]
                                              .targetIndex,
                                          index + rowMembers.ceil()),
                                      style: TextStyle(
                                          color: TargetHandler
                                              .targets[ScoreHandler
                                                  .scoresheets[currentSheetID]
                                                  .targetIndex]
                                              .getTextColor(
                                                  index + rowMembers.ceil())))),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            )
          ],
        ));
  }
}
