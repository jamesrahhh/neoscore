import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../browser/browser_view.dart';
import '../settings/settings_view.dart';
import 'navigation_viewmodel.dart';
import 'widgets/navigation_bottombar.dart';

class NavigationView extends ConsumerWidget {
  const NavigationView({super.key});

  static const List<Widget> _pages = <Widget>[BrowserView(), SettingsView()];

  @override
  Widget build(BuildContext context, WidgetRef ref) => Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        floatingActionButton: const NavigationBottomBar(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: _pages[ref.watch(navigationViewModelProvider)],
      );
}
