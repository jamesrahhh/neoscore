import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'scoresheet_model.dart';
import 'widgets/scoresheet_card.dart';

class ScoresheetBrowserView extends StatelessWidget {
  const ScoresheetBrowserView({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Scrollbar(
      thickness: 8,
      radius: const Radius.circular(4),
      interactive: true,
      child: CustomScrollView(
        slivers: <Widget>[
          const SliverAppBar(floating: true, title: Text('Scoresheets')),
          const SliverPadding(padding: EdgeInsets.only(top: 10)),
          SliverGrid.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 500,
              mainAxisExtent: 194,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (_, int index) => ScoresheetCard(index: index),
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
