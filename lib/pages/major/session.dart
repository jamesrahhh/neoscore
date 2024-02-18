import 'package:flutter/material.dart';
import 'package:neuralflight/components/CustomAppBar.dart';
import 'package:neuralflight/components/handler/scorehandler.dart';
import 'package:neuralflight/components/object/scoresheet.dart';

class Session extends StatefulWidget {
  const Session({super.key});

  @override
  State<Session> createState() => _SessionState();
}

class _SessionState extends State<Session> {
  int _currentSheetID = 0;

  @override
  Widget build(BuildContext context) {
    if (_currentSheetID == 0) {
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
                _currentSheetID =
                    ScoreHandler.createScoresheet(Target.nfaa, 20);
              });
            }),
      );
    } else {
      return Scaffold(
        appBar: const CustomAppBar(pageName: 'Session'),
        backgroundColor: Colors.white,
        body: Center(
          child: ListView.builder(
            itemCount: 1,
            itemBuilder: (BuildContext context, int index) {
              return Text('$_currentSheetID');
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add_rounded),
            onPressed: () {
              setState(() {
                _currentSheetID =
                    ScoreHandler.createScoresheet(Target.nfaa, 20);
              });
            }),
      );
    }
  }
}
