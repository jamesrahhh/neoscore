import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'scoresheet_model.dart';
import 'widgets/scoresheet_card.dart';

class ScoresheetBrowserView extends StatelessWidget {
  const ScoresheetBrowserView({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Theme.of(context).colorScheme.primary,
    body: Scrollbar(
      thickness: 8,
      radius: const Radius.circular(4),
      interactive: true,
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            floating: true,
            title: Row(
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
          ),
          const SliverPadding(padding: EdgeInsets.only(top: 10)),
          SliverGrid.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 500,
              mainAxisExtent: 204,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (_, int index) => ScoresheetCard(index: index % 2),
            itemCount:
                Provider.of<ScoresheetModel>(
                  context,
                  listen: false,
                ).getScoresheetAmount *
                10,
          ),
        ],
      ),
    ),
  );
}
