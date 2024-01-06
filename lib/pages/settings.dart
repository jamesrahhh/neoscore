import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text("Settings", style: TextStyle(color: Colors.white))), backgroundColor: Colors.black,),
      backgroundColor: Colors.grey,
    );
  }
}
