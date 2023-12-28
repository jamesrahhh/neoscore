import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.lightBlueAccent,
          body: Center(
            child: Container(
                height: MediaQuery.of(context).size.height,
                width: 150,
                color: Colors.lightBlue,
                child: const Center(
                  child: Text(
                    "Flutter App",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                )),
          )),
    );
  }
}
