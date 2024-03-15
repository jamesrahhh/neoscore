import 'package:flutter/material.dart';
import 'package:neuralflight/pages/major/session.dart';
import 'package:neuralflight/pages/major/history.dart';
import 'package:neuralflight/pages/major/insights.dart';
import 'package:neuralflight/pages/major/settings.dart';

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

  final int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'DM Sans'),
        home: Scaffold(body: _pages[_pageIndex]));
  }
}
