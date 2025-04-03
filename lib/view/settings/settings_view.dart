import 'package:flutter/material.dart';

import '../../common/widgets/logo.dart';
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
          const Padding(padding: EdgeInsets.all(6.0), child: Logo()),
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
