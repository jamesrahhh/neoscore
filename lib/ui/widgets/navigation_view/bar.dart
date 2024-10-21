import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../views/navigation/navigation_viewmodel.dart';

class Bar extends StatefulWidget {
  const Bar({super.key});

  @override
  State<Bar> createState() => _BarState();
}

class _BarState extends State<Bar> {
  @override
  Widget build(BuildContext context) => BottomNavigationBar(
          onTap: (int index) =>
              Provider.of<NavigationViewModel>(context, listen: false)
                  .setPage(index),
          currentIndex: Provider.of<NavigationViewModel>(context).pageIndex,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.assignment), label: 'Scoresheets'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Settings')
          ]);
}
