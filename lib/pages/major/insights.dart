import 'package:flutter/material.dart';

class Insights extends StatefulWidget {
  const Insights({super.key});

  @override
  State<Insights> createState() => _InsightsState();
}

class _InsightsState extends State<Insights> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text("Insights", style: TextStyle(color: Colors.white))),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.white,
    );
  }
}
