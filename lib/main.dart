import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app/app.dart';
import 'util/firebase/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  FlutterError.onError =
      (FlutterErrorDetails errorDetails) =>
          FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);

  PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  LicenseRegistry.addLicense(() async* {
    final String license = await rootBundle.loadString(
      'fonts/OFL_Montserrat.txt',
    );
    yield LicenseEntryWithLineBreaks(<String>['montserrat'], license);
  });

  LicenseRegistry.addLicense(() async* {
    final String license = await rootBundle.loadString(
      'fonts/OFL_NotoSans.txt',
    );
    yield LicenseEntryWithLineBreaks(<String>['noto'], license);
  });

  runApp(const Neoscore());
}
