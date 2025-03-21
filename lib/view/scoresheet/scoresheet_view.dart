import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'scoresheet_browser.dart';
import 'scoresheet_editor.dart';
import 'scoresheet_viewmodel.dart';

class ScoresheetView extends StatefulWidget {
  const ScoresheetView({super.key});

  @override
  State<ScoresheetView> createState() => _ScoresheetViewState();
}

class _ScoresheetViewState extends State<ScoresheetView> {
  final List<Widget> _pages = const <Widget>[
    ScoresheetBrowser(),
    ScoresheetEditor(),
  ];

  @override
  Widget build(BuildContext context) =>
      _pages[Provider.of<ScoresheetViewModel>(context).pageIndex];
}
