import 'package:flutter/material.dart';
import 'package:neuralflight/components/handler/scorehandler.dart';
import 'package:neuralflight/components/handler/targethandler.dart';

/// Bottom sheet widget that serves as a custom keyboard for entering scores.
class CustomBottomSheet extends StatelessWidget {
  final int currentSheetID;

  const CustomBottomSheet({super.key, required this.currentSheetID});

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
            SizedBox(
              height: 60,
              child: Flexible(
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: rowMembers.ceil(),
                    itemBuilder: (BuildContext horizontalContext, int index) {
                      return SizedBox(
                        width: (screenWidth - 30) / (rowMembers.ceil()),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(colors: [
                                  TargetHandler.targets[ScoreHandler
                                          .scoresheets[currentSheetID]
                                          .targetIndex]
                                      .getRingColors(index)[0],
                                  TargetHandler.targets[ScoreHandler
                                          .scoresheets[currentSheetID]
                                          .targetIndex]
                                      .getRingColors(index)[1]
                                ])),
                            child: Center(
                                child: Text(
                                    TargetHandler.parseScore(
                                        TargetHandler.targets[ScoreHandler
                                            .scoresheets[currentSheetID]
                                            .targetIndex],
                                        index),
                                    style: TextStyle(
                                        color: TargetHandler.targets[
                                                ScoreHandler
                                                    .scoresheets[currentSheetID]
                                                    .targetIndex]
                                            .getRingColors(index)[2]))),
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
                      return SizedBox(
                        width: (screenWidth - 30) / (rowMembers.floor()),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(colors: [
                                  TargetHandler.targets[ScoreHandler
                                          .scoresheets[currentSheetID]
                                          .targetIndex]
                                      .getRingColors(
                                          index + rowMembers.ceil())[0],
                                  TargetHandler.targets[ScoreHandler
                                          .scoresheets[currentSheetID]
                                          .targetIndex]
                                      .getRingColors(
                                          index + rowMembers.ceil())[1]
                                ])),
                            child: Center(
                                child: Text(
                                    TargetHandler.parseScore(
                                        TargetHandler.targets[ScoreHandler
                                            .scoresheets[currentSheetID]
                                            .targetIndex],
                                        index + rowMembers.ceil()),
                                    style: TextStyle(
                                        color: TargetHandler.targets[
                                                ScoreHandler
                                                    .scoresheets[currentSheetID]
                                                    .targetIndex]
                                            .getRingColors(index +
                                                rowMembers.ceil())[2]))),
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
