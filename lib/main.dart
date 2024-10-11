import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:neoscore/firebase_options.dart';
import 'package:neoscore/ui/pages/home.dart';
import 'package:neoscore/ui/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
