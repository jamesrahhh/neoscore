import 'package:flutter/material.dart';

import '../navigation/widgets/navigation_bottombar.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    floatingActionButton: const NavigationBottomBar(),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Text(
              'Settings',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          TextButton(
            onPressed: () => showLicensePage(context: context),
            child: Text(
              'Show Licenses',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        ],
      ),
    ),
  );
}
