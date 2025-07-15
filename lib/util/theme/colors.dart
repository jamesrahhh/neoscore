import 'package:flutter/material.dart';

class ThemeColors extends ThemeExtension<ThemeColors> {
  const ThemeColors({required this.colors});

  final List<List<Color>>? colors;

  @override
  ThemeExtension<ThemeColors> copyWith({List<List<Color>>? colors}) => ThemeColors(colors: colors);

  @override
  ThemeExtension<ThemeColors> lerp(_, __) => this;
}
