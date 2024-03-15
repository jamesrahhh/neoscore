import 'package:flutter/material.dart';

/// A custom widget providing the AppBar for most pages.
///
/// Takes [pageName] to display the page of the name, and optionally takes [actions].
class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(children: const [
      DrawerHeader(child: Text('Yo')),
      ListTile(
          leading: Icon(Icons.description_rounded), title: Text('Session')),
      ListTile(
          leading: Icon(Icons.format_list_numbered_rounded),
          title: Text('History')),
      ListTile(leading: Icon(Icons.insights_rounded), title: Text('Insights')),
      ListTile(leading: Icon(Icons.settings_rounded), title: Text('Settings')),
    ]));
  }
}
