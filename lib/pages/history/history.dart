import 'package:flutter/material.dart';
import 'package:neoscore/components/navigation/navigationglobaldrawer.dart';

/// Page for displaying usage history.
class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  // TODO: Add functionality.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationGlobalDrawer(),
      appBar: AppBar(
          title: const Text('History',
              style: TextStyle(fontWeight: FontWeight.bold))),
      backgroundColor: Colors.white,
    );
  }
}
