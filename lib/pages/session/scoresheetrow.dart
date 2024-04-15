import 'package:flutter/material.dart';
import 'package:neuralflight/components/scoresheet/scorehandler.dart';
import 'package:neuralflight/components/target/targethandler.dart';
import 'package:neuralflight/pages/session/scorekeyboard.dart';

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

class _ScoresheetRowState extends State<ScoresheetRow>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _swipeAnimation;
  late Animation<double> _leftWidgetAnimation;
  late Animation<double> _rightWidgetAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 150));
    _swipeAnimation = Tween<Offset>(begin: Offset.zero, end: Offset.zero)
        .animate(CurvedAnimation(
            parent: _animationController, curve: Curves.decelerate));
    _leftWidgetAnimation =
        _animationController.drive(Tween<double>(begin: 0.0, end: 0.0));
    _rightWidgetAnimation =
        _animationController.drive(Tween<double>(begin: 0.0, end: 0.0));
    _animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _showScoreKeyboard({required BuildContext context}) {
    Scaffold.of(context).showBottomSheet((BuildContext context) {
      return ScoreKeyboard(
        update: widget.refreshSessionState,
        scoresheetIndex: widget.scoresheetIndex,
        endIndex: widget.endIndex,
        shotIndex: ScoreHandler
            .scoresheets[widget.scoresheetIndex].ends[widget.endIndex].length,
      );
    });
  }

  Future<void> _showDeleteEndDialog({required BuildContext context}) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Delete end?'),
            actions: [
              TextButton(
                  onPressed: () {
                    ScoreHandler.scoresheets[widget.scoresheetIndex].ends
                        .removeAt(widget.endIndex);
                    widget.refreshSessionState();
                    Navigator.of(context).pop();
                  },
                  child: const Text('Yes')),
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('No'))
            ],
          );
        });
  }

  void _runAnimation(
      {required bool direction, required DragUpdateDetails details}) {
    _swipeAnimation =
        Tween(begin: Offset.zero, end: Offset(direction ? 0.3 : -0.3, 0.0))
            .animate(CurvedAnimation(
                parent: _animationController, curve: Curves.decelerate));
    if (direction) {
      _leftWidgetAnimation = Tween(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
              parent: _animationController, curve: Curves.decelerate));
    } else {
      _rightWidgetAnimation = Tween(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
              parent: _animationController, curve: Curves.decelerate));
    }
    _animationController.forward().whenComplete(() {
      _animationController.reverse().whenComplete(() {
        if (direction) {
          _leftWidgetAnimation =
              _animationController.drive(Tween(begin: 0.0, end: 0.0));
          _showDeleteEndDialog(context: context);
        } else {
          _rightWidgetAnimation =
              _animationController.drive(Tween(begin: 0.0, end: 0.0));
          _showScoreKeyboard(context: context);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        if (details.delta.dx > 5) {
          _runAnimation(direction: true, details: details);
        }
        if (details.delta.dx < -5) {
          _runAnimation(direction: false, details: details);
        }
      },
      child: Stack(
        alignment: Alignment.center,
        fit: StackFit.passthrough,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AnimatedOpacity(
                opacity: _leftWidgetAnimation.value,
                duration: const Duration(milliseconds: 150),
                curve: Curves.decelerate,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: const ShapeDecoration(
                        shape: CircleBorder(),
                        color: Color.fromARGB(150, 255, 0, 0)),
                    child: const Padding(
                      padding: EdgeInsets.all(6.0),
                      child: Icon(Icons.delete_rounded, size: 15),
                    ),
                  ),
                ),
              ),
              AnimatedOpacity(
                opacity: _rightWidgetAnimation.value,
                duration: const Duration(milliseconds: 150),
                curve: Curves.decelerate,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: const ShapeDecoration(
                        shape: CircleBorder(),
                        color: Color.fromARGB(150, 0, 255, 0)),
                    child: const Padding(
                      padding: EdgeInsets.all(6.0),
                      child: Icon(Icons.add_rounded, size: 15),
                    ),
                  ),
                ),
              )
            ],
          ),
          SlideTransition(
            position: _swipeAnimation,
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
                      itemCount: ScoreHandler
                          .scoresheets[widget.scoresheetIndex]
                          .ends[widget.endIndex]
                          .length,
                      itemBuilder:
                          (BuildContext horizontalContext, int shotIndex) {
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
                                (ScoreHandler
                                    .scoresheets[widget.scoresheetIndex]
                                    .ends[widget.endIndex]
                                    .length),
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
                                        color: TargetHandler.targets[
                                                ScoreHandler
                                                    .scoresheets[
                                                        widget.scoresheetIndex]
                                                    .targetIndex]
                                            .getTextColor(ScoreHandler
                                                    .scoresheets[
                                                        widget.scoresheetIndex]
                                                    .ends[widget.endIndex]
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
          )
        ],
      ),
    );
  }
}
