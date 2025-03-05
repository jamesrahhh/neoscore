import 'package:flutter/material.dart';

import 'colors.dart';

const TextTheme _baseTextTheme = TextTheme(
  displaySmall: TextStyle(
    fontSize: 16,
    fontVariations: <FontVariation>[FontVariation('wght', 800)],
  ),
  displayMedium: TextStyle(
    fontSize: 20,
    fontVariations: <FontVariation>[FontVariation('wght', 800)],
  ),
  displayLarge: TextStyle(
    fontSize: 28,
    fontVariations: <FontVariation>[FontVariation('wght', 800)],
  ),
  titleSmall: TextStyle(
    fontSize: 14,
    fontVariations: <FontVariation>[FontVariation('wght', 400)],
  ),
  titleMedium: TextStyle(
    fontSize: 18,
    fontVariations: <FontVariation>[FontVariation('wght', 400)],
  ),
  titleLarge: TextStyle(
    fontSize: 24,
    fontVariations: <FontVariation>[FontVariation('wght', 400)],
  ),
  bodySmall: TextStyle(
    fontSize: 14,
    fontVariations: <FontVariation>[FontVariation('wght', 400)],
  ),
  bodyMedium: TextStyle(
    fontSize: 18,
    fontVariations: <FontVariation>[FontVariation('wght', 400)],
  ),
  bodyLarge: TextStyle(
    fontSize: 20,
    fontVariations: <FontVariation>[FontVariation('wght', 400)],
  ),
);

final ThemeData _baseTheme = ThemeData(fontFamily: 'Roboto');

final ThemeData lightTheme = _baseTheme.copyWith(
  brightness: Brightness.light,
  iconTheme: const IconThemeData(color: Color(0xFF969696)),
  textTheme: _baseTextTheme.apply(
    displayColor: const Color(0xFF1C1C1C),
    bodyColor: const Color(0xFF575757),
  ),
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    error: Color(0xFFF84141),
    onError: Color(0xFF575757),
    onPrimary: Color(0xFF575757),
    onSecondary: Color(0xFF575757),
    onSurface: Color(0xFF575757),
    outline: Color(0xFFE4E0E2),
    primary: Color(0xFFEDEBE8),
    primaryContainer: Color(0xFFE4E0E2),
    secondary: Color(0xFFE4E0E2),
    shadow: Color(0xFFE4E0E2),
    surface: Color(0xFFFFFAF3),
    surfaceContainer: Color(0xFFF3F2ED),
    surfaceContainerLow: Color(0xFFF3F2ED),
    tertiary: Color(0xFF969696),
  ),
  extensions: <ThemeExtension<dynamic>>[
    const ThemeColors(
      colors: <Color>[
        Colors.red,
        Colors.yellow,
        Colors.lightBlue,
        Colors.blue,
        Colors.white,
        Colors.grey,
        Colors.black,
      ],
    ),
  ],
);

final ThemeData darkTheme = _baseTheme.copyWith(
  brightness: Brightness.dark,
  iconTheme: const IconThemeData(color: Color(0xFF707070)),
  textTheme: _baseTextTheme.apply(
    displayColor: const Color(0xFFE8E8E8),
    bodyColor: const Color(0xFFB8B8B8),
  ),
  colorScheme: const ColorScheme(
    brightness: Brightness.dark,
    error: Color(0xFFE92C2C),
    onError: Color(0xFFB8B8B8),
    onPrimary: Color(0xFFB8B8B8),
    onSecondary: Color(0xFFB8B8B8),
    onSurface: Color(0xFFB8B8B8),
    outline: Color(0xFF292929),
    primary: Color(0xFF111111),
    primaryContainer: Color(0xFF292929),
    secondary: Color(0xFF292929),
    shadow: Color(0xFF292929),
    surface: Color(0xFF1C1C1C),
    surfaceContainer: Color(0xFF111111),
    surfaceContainerLow: Color(0xFF111111),
    tertiary: Color(0xFF707070),
  ),
  extensions: <ThemeExtension<dynamic>>[
    const ThemeColors(
      colors: <Color>[
        Colors.red,
        Colors.yellow,
        Colors.lightBlue,
        Colors.blue,
        Colors.white,
        Colors.grey,
        Colors.black,
      ],
    ),
  ],
);
