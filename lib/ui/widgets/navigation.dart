import 'package:flutter/material.dart';

class Navigation extends StatelessWidget {
  const Navigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
          icon: Icon(Icons.assignment), label: 'Scoresheets'),
      BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings')
    ]);
  }
}
