import 'package:flutter/material.dart';
import 'package:neoscore/components/navigation/navigationmodel.dart';
import 'package:neoscore/pages/account/account.dart';
import 'package:neoscore/pages/session/sessionactive.dart';
import 'package:neoscore/pages/session/sessionpassive.dart';
import 'package:neoscore/pages/history/history.dart';
import 'package:neoscore/pages/insights/insights.dart';
import 'package:neoscore/pages/settings/settings.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => NavigationModel(), child: Neoscore()));
}

/// Main class.
class Neoscore extends StatelessWidget {
  Neoscore({super.key});

  final List<Widget> pages = [
    const SessionPassive(),
    const History(),
    const Insights()
  ];

  @override
  Widget build(BuildContext context) {
    final int pageIndex = Provider.of<NavigationModel>(context).pageIndex;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'DM Sans'),
        title: 'Neoscore',
        routes: {
          '/account': (context) => const Account(),
          '/settings': (context) => const Settings()
        },
        onGenerateRoute: (settings) {
          final arguments = settings.arguments;
          if (settings.name == '/sessionactive' && arguments is int) {
            return MaterialPageRoute(builder: (context) {
              return SessionActive(scoresheetIndex: arguments);
            });
          }
          return null;
        },
        home: pages[pageIndex]);
  }
}
