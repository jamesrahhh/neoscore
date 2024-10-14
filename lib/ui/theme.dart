import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

const TextTheme _textTheme = TextTheme(
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

final ThemeData lightTheme = FlexThemeData.light(
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
    visualDensity: FlexColorScheme.comfortablePlatformDensity);

final ThemeData darkTheme = FlexThemeData.dark(
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
    visualDensity: FlexColorScheme.comfortablePlatformDensity);
