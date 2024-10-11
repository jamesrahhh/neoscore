import 'package:flutter/material.dart';
import 'package:neoscore/ui/pages/home.dart';
import 'package:neoscore/ui/theme.dart';

void main() {
  runApp(const Neoscore());
}

class Neoscore extends StatelessWidget {
  const Neoscore({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Neoscore',
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.system,
        home: const Home(),
      );
}
