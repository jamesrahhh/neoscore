import 'package:flutter/material.dart';

class Session extends StatefulWidget {
  const Session({super.key});

  @override
  State<Session> createState() => _SessionState();
}

class _SessionState extends State<Session> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text("Session", style: TextStyle(color: Colors.white))), backgroundColor: Colors.black,),
      backgroundColor: Colors.grey,
    );
  }
}
