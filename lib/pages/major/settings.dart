import 'package:flutter/material.dart';
import 'package:neuralflight/components/widget/customappbar.dart';

/// Page for changing app settings.
class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  // TODO: Add functionality.
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(pageName: 'Settings'),
      backgroundColor: Colors.white,
    );
  }
}
