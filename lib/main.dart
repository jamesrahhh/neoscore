import 'package:flutter/material.dart';
import 'package:neuralflight/pages/major/insights.dart';
import 'package:neuralflight/pages/major/session.dart';
import 'package:neuralflight/pages/major/history.dart';
import 'package:neuralflight/pages/major/settings.dart';
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
  final List _pages = [
    const Session(),
    const History(),
    const Insights(),
    const Settings()
  ];

  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'DM Sans'),
        home: Scaffold(
            extendBody: true,
            bottomNavigationBar: CrystalNavigationBar(
              items: [
                CrystalNavigationBarItem(icon: Icons.description_rounded),
                CrystalNavigationBarItem(
                    icon: Icons.format_list_numbered_rounded),
                CrystalNavigationBarItem(icon: Icons.insights_rounded),
                CrystalNavigationBarItem(icon: Icons.settings_rounded)
              ],
              selectedItemColor: Colors.black,
              onTap: (index) {
                setState(() {
                  _pageIndex = index;
                });
              },
              backgroundColor: Colors.black.withOpacity(0.1),
              currentIndex: _pageIndex,
              enableFloatingNavBar: true,
            ),
            body: _pages[_pageIndex]));
  }
}
