import 'package:flutter/material.dart';

/// A custom widget providing the AppBar for most pages.
///
/// Takes [pageName] to display the page of the name, and optionally takes [actions].
class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(children: [
      const DrawerHeader(child: Text('Header')),
      ListTile(
        leading: const Icon(Icons.description_rounded),
        title: const Text('Session'),
        onTap: () {
          Navigator.pop(context);
          Navigator.pushNamed(context, '/session');
        },
      ),
      ListTile(
        leading: const Icon(Icons.format_list_numbered_rounded),
        title: const Text('History'),
        onTap: () {
          Navigator.pop(context);
          Navigator.pushNamed(context, '/history');
        },
      ),
      ListTile(
        leading: const Icon(Icons.insights_rounded),
        title: const Text('Insights'),
        onTap: () {
          Navigator.pop(context);
          Navigator.pushNamed(context, '/insights');
        },
      ),
      ListTile(
        leading: const Icon(Icons.settings_rounded),
        title: const Text('Settings'),
        onTap: () {
          Navigator.pop(context);
          Navigator.pushNamed(context, '/settings');
        },
      ),
    ]));
  }
}
