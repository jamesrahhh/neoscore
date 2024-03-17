import 'package:flutter/material.dart';
import 'package:neuralflight/pages/account.dart';
import 'package:neuralflight/pages/session.dart';
import 'package:neuralflight/pages/history.dart';
import 'package:neuralflight/pages/insights.dart';
import 'package:neuralflight/pages/settings.dart';

void main() {
  runApp(const NeuralFLIGHT());
}

/// Main class.
class NeuralFLIGHT extends StatefulWidget {
  const NeuralFLIGHT({super.key});

  @override
  State<NeuralFLIGHT> createState() => _NeuralFLIGHTState();
}

class _NeuralFLIGHTState extends State<NeuralFLIGHT> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'DM Sans'),
      title: 'neuralflight',
      routes: {
        '/account': (context) => const Account(),
        '/session': (context) => const Session(),
        '/history': (context) => const History(),
        '/insights': (context) => const Insights(),
        '/settings': (context) => const Settings()
      },
      initialRoute: '/session',
    );
  }
}
