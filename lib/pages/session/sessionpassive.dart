import 'package:flutter/material.dart';
import 'package:neuralflight/components/scoresheet/scorehandler.dart';
import 'package:neuralflight/components/navigation/navigationglobaldrawer.dart';

class SessionPassive extends StatelessWidget {
  const SessionPassive({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Session',
              style: TextStyle(fontWeight: FontWeight.bold))),
      backgroundColor: Colors.white,
      body: const Center(
        child: Text('No active session'),
      ),
      drawer: const NavigationGlobalDrawer(),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add_rounded),
          onPressed: () {
            int scoresheetIndex = ScoreHandler.createScoresheet(0, 20);
            Navigator.pushNamed(context, '/sessionactive',
                arguments: scoresheetIndex);
          }),
    );
  }
}
