import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../browser/browser_view.dart';
import '../browser/browser_viewmodel.dart';
import '../settings/settings_view.dart';
import 'navigation_viewmodel.dart';
import 'widgets/navigation_bottombar.dart';

class NavigationView extends StatefulWidget {
  const NavigationView({super.key});

  @override
  State<NavigationView> createState() => _NavigationViewState();
}

class _NavigationViewState extends State<NavigationView> {
  final List<Widget> _pages = const <Widget>[BrowserView(), SettingsView()];

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: <ChangeNotifierProvider<ChangeNotifier>>[
          ChangeNotifierProvider<NavigationViewModel>(
            create: (_) => NavigationViewModel(),
          ),
          ChangeNotifierProvider<BrowserViewModel>(
            create: (_) => BrowserViewModel(),
          ),
        ],
        builder: (BuildContext context, _) => Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          floatingActionButton: const NavigationBottomBar(),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          body: _pages[Provider.of<NavigationViewModel>(context).pageIndex],
        ),
      );
}
