import 'package:flutter/material.dart';
import 'package:neuralflight/components/scoresheet/scorehandler.dart';
import 'package:neuralflight/components/target/targethandler.dart';
import 'package:neuralflight/pages/session/scorekeyboard.dart';
import 'package:swipe_to/swipe_to.dart';

class ScoresheetRow extends StatefulWidget {
  final Function() refreshSessionState;
  final int scoresheetIndex;
  final int endIndex;
  final List<List<int>> scoreData;

  const ScoresheetRow(
      {super.key,
      required this.refreshSessionState,
      required this.scoresheetIndex,
      required this.endIndex,
      required this.scoreData});

  @override
  State<ScoresheetRow> createState() => _ScoresheetRowState();
}

/*Scaffold.of(context).showBottomSheet((BuildContext context) {
              return ScoreKeyboard(
                update: widget.refreshSessionState,
                scoresheetIndex: widget.scoresheetIndex,
                endIndex: widget.endIndex,
                shotIndex: ScoreHandler.scoresheets[widget.scoresheetIndex]
                    .ends[widget.endIndex].length,
              );
            });*/
class _ScoresheetRowState extends State<ScoresheetRow> {
  @override
  Widget build(BuildContext context) {
    return SwipeTo(
      iconOnLeftSwipe: Icons.add_rounded,
      iconOnRightSwipe: Icons.delete_rounded,
      onLeftSwipe: (details) =>
          Scaffold.of(context).showBottomSheet((BuildContext context) {
        return ScoreKeyboard(
          update: widget.refreshSessionState,
          scoresheetIndex: widget.scoresheetIndex,
          endIndex: widget.endIndex,
          shotIndex: ScoreHandler
              .scoresheets[widget.scoresheetIndex].ends[widget.endIndex].length,
        );
      }),
      child: SizedBox(
        height: 40,
        child: Row(
          children: [
            SizedBox(
              width: 30,
              child: Center(
                child: Text(
                  '${widget.endIndex + 1}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Flexible(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: ScoreHandler.scoresheets[widget.scoresheetIndex]
                    .ends[widget.endIndex].length,
                itemBuilder: (BuildContext horizontalContext, int shotIndex) {
                  double screenWidth = MediaQuery.of(context).size.width;
                  return InkWell(
                    onTap: () {
                      Scaffold.of(horizontalContext)
                          .showBottomSheet((BuildContext context) {
                        return ScoreKeyboard(
                          update: widget.refreshSessionState,
                          scoresheetIndex: widget.scoresheetIndex,
                          endIndex: widget.endIndex,
                          shotIndex: shotIndex,
                        );
                      });
                    },
                    child: SizedBox(
                      width: (screenWidth - 80) /
                          (ScoreHandler.scoresheets[widget.scoresheetIndex]
                              .ends[widget.endIndex].length),
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: TargetHandler.targets[ScoreHandler
                                      .scoresheets[widget.scoresheetIndex]
                                      .targetIndex]
                                  .getRingGradient(ScoreHandler
                                      .scoresheets[widget.scoresheetIndex]
                                      .ends[widget.endIndex][shotIndex])),
                          child: Center(
                            child: Text(
                              TargetHandler.parseScore(
                                  ScoreHandler
                                      .scoresheets[widget.scoresheetIndex]
                                      .targetIndex,
                                  ScoreHandler
                                      .scoresheets[widget.scoresheetIndex]
                                      .ends[widget.endIndex][shotIndex]),
                              style: TextStyle(
                                  color: TargetHandler.targets[ScoreHandler
                                          .scoresheets[widget.scoresheetIndex]
                                          .targetIndex]
                                      .getTextColor(ScoreHandler
                                          .scoresheets[widget.scoresheetIndex]
                                          .ends[widget.endIndex][shotIndex])),
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
                  '${widget.scoreData[1][widget.endIndex] - (widget.endIndex == 0 ? 0 : widget.scoreData[1][widget.endIndex - 1])}',
                ),
              ),
            ),
            SizedBox(
              width: 30,
              child: Center(
                child: Text(
                  '${widget.scoreData[0][widget.endIndex] - (widget.endIndex == 0 ? 0 : widget.scoreData[0][widget.endIndex - 1])}',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
