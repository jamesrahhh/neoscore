import 'package:flutter/material.dart';
import 'package:neuralflight/components/scoresheet/scorehandler.dart';
import 'package:neuralflight/components/target/targethandler.dart';
import 'package:neuralflight/pages/session/scoresheetbuttons.dart';
import 'package:neuralflight/pages/session/scoresheetrow.dart';

class SessionActive extends StatefulWidget {
  const SessionActive({super.key, required this.scoresheetIndex});

  final int scoresheetIndex;

  @override
  State<SessionActive> createState() => _SessionActiveState();
}

class _SessionActiveState extends State<SessionActive> {
  List<List<int>> scoreData = [
    [0],
    [0],
    [0, 0]
  ];

  void refreshSessionState() {
    setState(() {
      scoreData = ScoreHandler.refreshScoreData(widget.scoresheetIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Scoresheet',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                    '${TargetHandler.targets[ScoreHandler.scoresheets[widget.scoresheetIndex].targetIndex].name} target, ${ScoreHandler.scoresheets[widget.scoresheetIndex].distance} yards',
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
                ScoreHandler.scoresheets[widget.scoresheetIndex].ends.length +
                    1,
            itemBuilder: (BuildContext verticalContext, int endIndex) {
              if (endIndex ==
                  ScoreHandler
                      .scoresheets[widget.scoresheetIndex].ends.length) {
                return SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AddEndButton(
                        scoresheetIndex: widget.scoresheetIndex,
                        refreshSessionState: refreshSessionState,
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
                return ScoresheetRow(
                    refreshSessionState: refreshSessionState,
                    scoresheetIndex: widget.scoresheetIndex,
                    endIndex: endIndex,
                    scoreData: scoreData);
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
