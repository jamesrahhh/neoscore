import 'package:flutter/material.dart';
import 'package:neuralflight/pages/home.dart';
import 'package:neuralflight/pages/session.dart';
import 'package:neuralflight/pages/history.dart';
import 'package:neuralflight/pages/settings.dart';
import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';

void main() {
  runApp(const NeuralFLIGHT());
}

class NeuralFLIGHT extends StatefulWidget {
  const NeuralFLIGHT({super.key});

  @override
  State<NeuralFLIGHT> createState() => _NeuralFLIGHTState();
}

class _NeuralFLIGHTState extends State<NeuralFLIGHT> {
  final List pages = [
    const Home(),
    const Session(),
    const History(),
    const Settings()
  ];

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
        theme: ThemeData(fontFamily: 'Inter'),
        home: Scaffold(
            extendBody: true,
            bottomNavigationBar: CrystalNavigationBar(
              items: [
                CrystalNavigationBarItem(icon: Icons.home),
                CrystalNavigationBarItem(icon: Icons.copy),
                CrystalNavigationBarItem(icon: Icons.history),
                CrystalNavigationBarItem(icon: Icons.settings)
              ],
              selectedItemColor: Colors.black,
              onTap: onNavbarTap,
              backgroundColor: Colors.black.withOpacity(0.1),
              currentIndex: pageIndex,
              enableFloatingNavBar: true,
            ),
            body: pages[pageIndex]));
  }
}
