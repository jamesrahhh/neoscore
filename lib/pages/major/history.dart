import 'package:flutter/material.dart';
import 'package:neuralflight/components/widget/customappbar.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(pageName: 'History'),
      backgroundColor: Colors.white,
    );
  }
}
