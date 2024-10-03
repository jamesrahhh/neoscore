import 'package:flutter/material.dart';

void main() {
  runApp(const Neoscore());
}

class Neoscore extends StatelessWidget {
  const Neoscore({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Neoscore',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text('Neoscore',
            style: TextStyle(
                decoration: TextDecoration.none, color: Colors.white)));
  }
}
