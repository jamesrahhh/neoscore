import 'package:flutter/material.dart';
import 'package:neuralflight/components/widget/customappbar.dart';

class Insights extends StatefulWidget {
  const Insights({super.key});

  @override
  State<Insights> createState() => _InsightsState();
}

class _InsightsState extends State<Insights> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(pageName: 'Insights'),
      backgroundColor: Colors.white,
    );
  }
}
