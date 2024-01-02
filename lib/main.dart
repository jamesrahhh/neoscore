import 'package:flutter/material.dart';
import 'package:neuralflight/pages/homepage.dart';

void main() {
  runApp(const NeuralFLIGHT());
}

class NeuralFLIGHT extends StatelessWidget {
  const NeuralFLIGHT({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blue,
        bottomNavigationBar: BottomNavigationBar(items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.copy), label: "Session"),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "History"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings")
        ], backgroundColor: Colors.blueAccent,),
        body: const HomePage()
        )
    );
  }
}
