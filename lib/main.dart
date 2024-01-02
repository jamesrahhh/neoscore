import 'package:flutter/material.dart';
import 'package:neuralflight/pages/homepage.dart';

void main() {
  runApp(const NeuralFLIGHT());
}

class NeuralFLIGHT extends StatelessWidget {
  const NeuralFLIGHT({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage()
    );
  }
}
