import 'package:flutter/material.dart';

class ThemeColors extends ThemeExtension<ThemeColors> {
  const ThemeColors({required this.colors});

  final List<Color>? colors;

  @override
  ThemeExtension<ThemeColors> copyWith({List<Color>? colors}) {
    return ThemeColors(colors: colors);
  }

  @override
  ThemeExtension<ThemeColors> lerp(
    covariant ThemeExtension<ThemeColors>? other,
    __,
  ) {
    return this;
  }
}
