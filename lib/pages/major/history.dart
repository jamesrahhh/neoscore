import 'package:flutter/material.dart';
import 'package:neuralflight/components/widget/customappbar.dart';

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
    return const Scaffold(
      appBar: CustomAppBar(pageName: 'History'),
      backgroundColor: Colors.white,
    );
  }
}
