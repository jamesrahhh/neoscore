import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../scoresheet/scoresheet_browserview.dart';
import '../scoresheet/scoresheet_model.dart';
import '../settings/settings_view.dart';
import 'navigation_viewmodel.dart';
import 'widgets/bar.dart';

class NavigationView extends StatefulWidget {
  const NavigationView({super.key});

  @override
  State<NavigationView> createState() => _NavigationViewState();
}

class _NavigationViewState extends State<NavigationView> {
  final List<Widget> _pages = const <Widget>[
    ScoresheetBrowserView(),
    SettingsView(),
  ];

  @override
  Widget build(BuildContext context) => MultiProvider(
    providers: <ChangeNotifierProvider<ChangeNotifier>>[
      ChangeNotifierProvider<NavigationViewModel>(
        create: (_) => NavigationViewModel(),
      ),
      ChangeNotifierProvider<ScoresheetModel>(create: (_) => ScoresheetModel()),
    ],
    builder:
        (BuildContext context, _) => Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          bottomNavigationBar: const Bar(),
          body: _pages[Provider.of<NavigationViewModel>(context).pageIndex],
        ),
  );
}
