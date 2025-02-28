import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'scoresheet_viewmodel.dart';
import 'widgets/scoresheet_browser.dart';
import 'widgets/scoresheet_editor.dart';

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
  Widget build(BuildContext context) => Consumer<ScoresheetViewModel>(
    builder:
        (BuildContext context, ScoresheetViewModel scoresheet, _) =>
            _pages[scoresheet.pageIndex],
  );
}
