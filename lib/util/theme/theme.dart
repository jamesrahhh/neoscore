import 'package:flutter/material.dart';

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
    outline: Color(0xFFE8E8E8),
    primary: Colors.white,
    primaryContainer: Color(0xFFE8E8E8),
    secondary: Color(0xFFE8E8E8),
    shadow: Color(0xFFE8E8E8),
    surface: Color(0xFFF7F7F7),
    surfaceContainer: Colors.white,
    surfaceContainerLow: Colors.white,
  ),
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
);
