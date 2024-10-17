import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/navigationmodel.dart';
import '../widgets/navigation.dart';
import 'scoresheet/scoresheetview.dart';
import 'settings/settingsview.dart';

class BaseView extends StatefulWidget {
  const BaseView({super.key});

  @override
  State<BaseView> createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> {
  final List<Widget> _pages = const <Widget>[ScoresheetView(), SettingsView()];

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider<NavigationModel>(
      create: (BuildContext context) => NavigationModel(),
      child: Scaffold(
          bottomNavigationBar: const Navigation(),
          body: Consumer<NavigationModel>(
            builder: (BuildContext context, NavigationModel navigation, _) =>
                _pages[navigation.pageIndex],
          )));
}
