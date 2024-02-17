import 'package:flutter/material.dart';
import 'package:neuralflight/components/CustomAppBar.dart';
import 'package:neuralflight/components/global.dart';
import 'package:neuralflight/components/scoresheet.dart';

class Session extends StatefulWidget {
  const Session({super.key});

  @override
  State<Session> createState() => _SessionState();
}

class _SessionState extends State<Session> {
  int _currentSheetID = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(pageName: 'Session'),
      backgroundColor: Colors.white,
      body: const Center(
        child: Text('No active session'),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        _currentSheetID = Global.createScoresheet(Target.nfaa, 20);
      }),
    );
  }
}
