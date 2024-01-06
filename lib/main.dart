import 'package:flutter/material.dart';
import 'package:neuralflight/pages/home.dart';
import 'package:neuralflight/pages/session.dart';
import 'package:neuralflight/pages/camera.dart';
import 'package:neuralflight/pages/history.dart';
import 'package:neuralflight/pages/settings.dart';

void main() {
  runApp(const NeuralFLIGHT());
}

class NeuralFLIGHT extends StatefulWidget {
  const NeuralFLIGHT({super.key});

  @override
  State<NeuralFLIGHT> createState() => _NeuralFLIGHTState();
}

class _NeuralFLIGHTState extends State<NeuralFLIGHT> {
  final List pages = [const Home(), const Session(), const Camera(), const History(), const Settings()];
  
  int pageIndex = 0;

  void onNavbarTap(int index) {
    setState(() {
      pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          fixedColor: Colors.black, 
          unselectedItemColor: Colors.grey,
          currentIndex: pageIndex, 
          onTap: onNavbarTap,
          items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home", backgroundColor: Colors.white),
          BottomNavigationBarItem(icon: Icon(Icons.copy), label: "Session"),
          BottomNavigationBarItem(icon: Icon(Icons.camera), label: "Camera"),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "History"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings")
        ],),
        body: pages[pageIndex]
        )
    );
  }
}
