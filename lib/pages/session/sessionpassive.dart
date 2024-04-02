import 'package:flutter/material.dart';
import 'package:neuralflight/components/model/scorehandler.dart';
import 'package:neuralflight/components/widget/customdrawer.dart';

class SessionPassive extends StatefulWidget {
  const SessionPassive({super.key});

  @override
  State<SessionPassive> createState() => _SessionPassiveState();
}

class _SessionPassiveState extends State<SessionPassive> {
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
      drawer: const CustomDrawer(),
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
