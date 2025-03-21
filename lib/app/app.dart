import 'package:flutter/material.dart';

import '../util/theme/theme.dart';
import '../view/navigation/navigation_view.dart';

class Neoscore extends StatelessWidget {
  const Neoscore({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Neoscore',
    theme: lightTheme,
    darkTheme: lightTheme,
    home: const NavigationView(),
  );
}
