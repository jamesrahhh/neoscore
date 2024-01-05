import 'package:flutter/material.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text("History", style: TextStyle(color: Colors.white, fontFamily: "assets/fonts/Inter-Regular.ttf"))), backgroundColor: Colors.black,),
      backgroundColor: Colors.grey,
    );
  }
}
