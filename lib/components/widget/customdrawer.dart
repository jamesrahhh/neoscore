import 'package:flutter/material.dart';
import 'package:neuralflight/components/model/navigationmodel.dart';
import 'package:provider/provider.dart';

/// A custom widget providing a navigation Drawer for most pages.
class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final Function(int) setPageIndex =
        Provider.of<NavigationModel>(context).setPageIndex;
    return Drawer(
        child: ListView(children: [
      const DrawerHeader(child: Text('Header')),
      ListTile(
        leading: const Icon(Icons.description_rounded),
        title: const Text('Session'),
        onTap: () {
          setPageIndex(0);
          Navigator.popUntil(
              context, ModalRoute.withName(Navigator.defaultRouteName));
        },
      ),
      ListTile(
        leading: const Icon(Icons.format_list_numbered_rounded),
        title: const Text('History'),
        onTap: () {
          setPageIndex(1);
          Navigator.popUntil(
              context, ModalRoute.withName(Navigator.defaultRouteName));
        },
      ),
      ListTile(
        leading: const Icon(Icons.insights_rounded),
        title: const Text('Insights'),
        onTap: () {
          setPageIndex(2);
          Navigator.popUntil(
              context, ModalRoute.withName(Navigator.defaultRouteName));
        },
      ),
      ListTile(
        leading: const Icon(Icons.settings_rounded),
        title: const Text('Settings'),
        onTap: () {
          if (ModalRoute.of(context)?.settings.name != '/settings') {
            Navigator.popAndPushNamed(context, '/settings');
          }
        },
      ),
    ]));
  }
}
