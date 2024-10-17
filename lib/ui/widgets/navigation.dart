import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/navigationmodel.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  @override
  Widget build(BuildContext context) => BottomNavigationBar(
          onTap: (int index) =>
              Provider.of<NavigationModel>(context, listen: false)
                  .setPage(index),
          currentIndex: Provider.of<NavigationModel>(context).pageIndex,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.assignment), label: 'Scoresheets'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Settings')
          ]);
}
