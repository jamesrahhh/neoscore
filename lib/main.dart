import 'package:flutter/material.dart';
import 'package:neuralflight/components/model/navigationmodel.dart';
import 'package:neuralflight/pages/account.dart';
import 'package:neuralflight/pages/session.dart';
import 'package:neuralflight/pages/history.dart';
import 'package:neuralflight/pages/insights.dart';
import 'package:neuralflight/pages/settings.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => NavigationModel(), child: const NeuralFLIGHT()));
}

/// Main class.
class NeuralFLIGHT extends StatefulWidget {
  const NeuralFLIGHT({super.key});

  @override
  State<NeuralFLIGHT> createState() => _NeuralFLIGHTState();
}

class _NeuralFLIGHTState extends State<NeuralFLIGHT> {
  final List<Widget> pages = [
    const Session(),
    const History(),
    const Insights()
  ];

  @override
  Widget build(BuildContext context) {
    final int pageIndex = Provider.of<NavigationModel>(context).pageIndex;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'DM Sans'),
        title: 'neuralflight',
        routes: {
          '/account': (context) => const Account(),
          '/settings': (context) => const Settings()
        },
        home: pages[pageIndex]);
  }
}
