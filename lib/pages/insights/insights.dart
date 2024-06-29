import 'package:flutter/material.dart';
import 'package:neoscore/components/navigation/navigationglobaldrawer.dart';

/// Page for presenting various user statistics and trends.
class Insights extends StatefulWidget {
  const Insights({super.key});

  @override
  State<Insights> createState() => _InsightsState();
}

class _InsightsState extends State<Insights> {
  // TODO: Add functionality.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationGlobalDrawer(),
      appBar: AppBar(
          title: const Text('Insights',
              style: TextStyle(fontWeight: FontWeight.bold))),
      backgroundColor: Colors.white,
    );
  }
}
