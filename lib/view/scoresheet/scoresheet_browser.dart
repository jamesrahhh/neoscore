import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'scoresheet_model.dart';
import 'scoresheet_viewmodel.dart';
import 'widgets/scoresheet_card.dart';

class ScoresheetBrowser extends StatelessWidget {
  const ScoresheetBrowser({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    floatingActionButton: FloatingActionButton(
      elevation: 0,
      onPressed:
          () => Provider.of<ScoresheetViewModel>(
            context,
            listen: false,
          ).setPage(1),
      child: const Icon(Icons.add),
    ),
    body: Scrollbar(
      thickness: 8.0,
      radius: const Radius.circular(4.0),
      interactive: true,
      child: CustomScrollView(
        slivers: <Widget>[
          const SliverAppBar(floating: true, title: Text('Scoresheets')),
          const SliverPadding(padding: EdgeInsets.only(top: 10.0)),
          SliverGrid.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 500.0,
              mainAxisExtent: 160.0,
              mainAxisSpacing: 10.0,
            ),
            itemBuilder:
                (BuildContext context, int index) =>
                    ScoresheetCard(index: index),
            itemCount:
                Provider.of<ScoresheetModel>(
                  context,
                  listen: false,
                ).getScoresheetAmount,
          ),
        ],
      ),
    ),
  );
}
