import 'package:flutter/material.dart';

import '../navigation/widgets/navigation_bottombar.dart';
import '../widgets/logo.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Theme.of(context).colorScheme.primary,
    floatingActionButton: const NavigationBottomBar(),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    body: Center(
      child: ColoredBox(
        color: Theme.of(context).colorScheme.surface,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 6,
          children: <Widget>[
            const Logo(),
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
    ),
  );
}
