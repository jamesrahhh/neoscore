import 'package:flutter/material.dart';

import 'colors.dart';

const TextTheme _textTheme = TextTheme(
  titleSmall: TextStyle(
    fontSize: 14,
    fontFamily: 'Montserrat',
    fontVariations: <FontVariation>[FontVariation('wght', 600)],
  ),
  titleMedium: TextStyle(
    fontSize: 18,
    fontFamily: 'Montserrat',
    fontVariations: <FontVariation>[FontVariation('wght', 600)],
  ),
  titleLarge: TextStyle(
    fontSize: 24,
    fontFamily: 'Montserrat',
    fontVariations: <FontVariation>[FontVariation('wght', 600)],
  ),
  bodySmall: TextStyle(
    fontSize: 14,
    fontFamily: 'Noto Sans',
    fontVariations: <FontVariation>[FontVariation('wght', 400)],
  ),
  bodyMedium: TextStyle(
    fontSize: 16,
    fontFamily: 'Noto Sans',
    fontVariations: <FontVariation>[FontVariation('wght', 400)],
  ),
  bodyLarge: TextStyle(
    fontSize: 22,
    fontFamily: 'Noto Sans',
    fontVariations: <FontVariation>[FontVariation('wght', 400)],
  ),
  displaySmall: TextStyle(
    fontSize: 12,
    fontFamily: 'Noto Sans',
    fontStyle: FontStyle.italic,
    fontVariations: <FontVariation>[FontVariation('wght', 400)],
  ),
  displayMedium: TextStyle(
    fontSize: 14,
    fontFamily: 'Noto Sans',
    fontStyle: FontStyle.italic,
    fontVariations: <FontVariation>[FontVariation('wght', 400)],
  ),
  displayLarge: TextStyle(
    fontSize: 16,
    fontFamily: 'Noto Sans',
    fontStyle: FontStyle.italic,
    fontVariations: <FontVariation>[FontVariation('wght', 400)],
  ),
);

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  iconTheme: const IconThemeData(color: Colors.grey),
  textTheme: _textTheme.apply(
    displayColor: const Color(0xFF1C1C1C),
    bodyColor: Colors.black,
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
    surface: Colors.white,
    surfaceContainer: Colors.white,
    surfaceContainerLow: Colors.white,
    tertiary: Color(0xFF969696),
  ),
  extensions: const <ThemeExtension<dynamic>>[
    ThemeColors(
      colors: <List<Color>>[
        <Color>[Color(0xFFbb302c), Color(0xFFff2222)],
        <Color>[Color(0xFFffed30), Color(0xFFfccb37)],
        <Color>[Color(0xFF00dde7), Color(0xFF0f91bd)],
        <Color>[Color(0xFF245786), Color(0xFF17274f)],
        <Color>[Color(0xFFc7c3c5), Color(0xFFF3F2ED)],
        <Color>[Color(0xFF575757), Color(0xFFAAAAAA)],
        <Color>[Colors.black, Color(0xFF555555)],
      ],
    ),
  ],
);
