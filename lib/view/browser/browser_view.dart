import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../util/scoresheet/scoresheet_model.dart';
import 'widgets/browser_bottombar.dart';
import 'widgets/browser_card.dart';

class BrowserView extends StatelessWidget {
  const BrowserView({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    floatingActionButton: const BrowserBottomBar(),
    backgroundColor: Theme.of(context).colorScheme.primary,
    body: Scrollbar(
      thickness: 8,
      radius: const Radius.circular(4),
      interactive: true,
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            floating: true,
            title: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SearchBar(
                      constraints: BoxConstraints.tight(const Size(275, 30)),
                      leading: const Icon(Icons.search),
                      hintText: 'Search scoresheets...',
                      textStyle: WidgetStateProperty.all(
                        Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.filter_alt),
                      onPressed: () => VoidCallback,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Row(
                    children: <Widget>[
                      Text(
                        'Last synced: never!!!',
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SliverPadding(padding: EdgeInsets.only(top: 10)),
          SliverGrid.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 500,
              mainAxisExtent: 204,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (_, int index) => BrowserCard(index: index),
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
