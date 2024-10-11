import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:neoscore/ui/widgets/circleicon.dart';

void main() {
  runApp(const Neoscore());
}

class Neoscore extends StatelessWidget {
  const Neoscore({super.key});

  final TextTheme _textTheme = const TextTheme(
    displaySmall:
        TextStyle(fontVariations: <FontVariation>[FontVariation('wght', 800)]),
    displayMedium:
        TextStyle(fontVariations: <FontVariation>[FontVariation('wght', 800)]),
    displayLarge:
        TextStyle(fontVariations: <FontVariation>[FontVariation('wght', 800)]),
    headlineSmall:
        TextStyle(fontVariations: <FontVariation>[FontVariation('wght', 700)]),
    headlineMedium:
        TextStyle(fontVariations: <FontVariation>[FontVariation('wght', 700)]),
    headlineLarge:
        TextStyle(fontVariations: <FontVariation>[FontVariation('wght', 700)]),
    titleSmall:
        TextStyle(fontVariations: <FontVariation>[FontVariation('wght', 600)]),
    titleMedium: TextStyle(
        fontSize: 35,
        fontVariations: <FontVariation>[FontVariation('wght', 600)]),
    titleLarge:
        TextStyle(fontVariations: <FontVariation>[FontVariation('wght', 600)]),
    bodySmall:
        TextStyle(fontVariations: <FontVariation>[FontVariation('wght', 400)]),
    bodyMedium:
        TextStyle(fontVariations: <FontVariation>[FontVariation('wght', 400)]),
    bodyLarge:
        TextStyle(fontVariations: <FontVariation>[FontVariation('wght', 400)]),
  );

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Neoscore',
        theme: FlexThemeData.light(
            textTheme: _textTheme.apply(
              bodyColor: Colors.black,
              displayColor: Colors.black,
            ),
            colors: const FlexSchemeColor(
              primary: Colors.black,
              primaryContainer: Colors.black,
              secondary: Colors.black,
              secondaryContainer: Colors.black,
              tertiary: Colors.black,
              tertiaryContainer: Colors.white,
              error: Colors.red,
              errorContainer: Colors.white,
            ),
            fontFamily: 'Montserrat',
            useMaterial3: true,
            visualDensity: FlexColorScheme.comfortablePlatformDensity),
        darkTheme: FlexThemeData.dark(
            textTheme: _textTheme.apply(
              bodyColor: Colors.white,
              displayColor: Colors.white,
            ),
            colors: const FlexSchemeColor(
              primary: Colors.white,
              primaryContainer: Colors.white,
              secondary: Colors.white,
              secondaryContainer: Colors.white,
              tertiary: Colors.white,
              tertiaryContainer: Colors.white,
              error: Colors.red,
              errorContainer: Colors.black,
            ),
            fontFamily: 'Montserrat',
            useMaterial3: true,
            visualDensity: FlexColorScheme.comfortablePlatformDensity),
        themeMode: ThemeMode.system,
        home: const Home(),
      );
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
          body: Center(
        child:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Padding(
              padding: const EdgeInsets.all(6.0),
              child: CircleIcon(radius: 35)),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Text(
              'Neoscore',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ]),
      ));
}
