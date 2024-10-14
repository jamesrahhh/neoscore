import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';
import 'ui/pages/baseview.dart';
import 'ui/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FlutterError.onError = (FlutterErrorDetails errorDetails) =>
      FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);

  PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  runApp(const Neoscore());
}

class Neoscore extends StatelessWidget {
  const Neoscore({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Neoscore',
        theme: lightTheme,
        darkTheme: darkTheme,
        home: const Home(),
      );
}
