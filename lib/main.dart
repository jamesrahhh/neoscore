import 'package:flutter/material.dart';
import 'package:neuralflight/pages/major/session.dart';
import 'package:neuralflight/pages/major/history.dart';
import 'package:neuralflight/pages/major/insights.dart';
import 'package:neuralflight/pages/major/settings.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';

void main() {
  runApp(const NeuralFLIGHT());
}

/// Main class. Manages BottomNavigationBar (for now.)
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
            bottomNavigationBar: CustomNavigationBar(
              items: [
                CustomNavigationBarItem(
                    icon: const Icon(Icons.description_rounded)),
                CustomNavigationBarItem(
                    icon: const Icon(Icons.format_list_numbered_rounded)),
                CustomNavigationBarItem(
                    icon: const Icon(Icons.insights_rounded)),
                CustomNavigationBarItem(
                    icon: const Icon(Icons.settings_rounded))
              ],
              selectedColor: Colors.black,
              strokeColor: Colors.black,
              onTap: (index) {
                setState(() {
                  _pageIndex = index;
                });
              },
              backgroundColor: Colors.black.withOpacity(0.1),
              currentIndex: _pageIndex,
            ),
            body: _pages[_pageIndex]));
  }
}
