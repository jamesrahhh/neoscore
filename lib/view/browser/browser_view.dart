import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'browser_viewmodel.dart';
import 'widgets/browser_card.dart';

class BrowserView extends StatelessWidget {
  const BrowserView({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        extendBodyBehindAppBar: true,
        body: Scrollbar(
          thickness: 6,
          radius: const Radius.circular(3),
          interactive: true,
          child: Consumer<BrowserViewModel>(
            builder: (
              BuildContext context,
              BrowserViewModel browserViewModel,
              _,
            ) =>
                NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification scrollNotification) {
                if (scrollNotification.metrics.pixels ==
                        scrollNotification.metrics.maxScrollExtent &&
                    browserViewModel.hasMore) {
                  browserViewModel.queryCards();
                }
                return false;
              },
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverAppBar(
                    pinned: true,
                    backgroundColor: Theme.of(context).colorScheme.surface.withAlpha(150),
                    toolbarHeight: 72,
                    flexibleSpace: ClipRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                        child: SafeArea(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 14),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    SearchBar(
                                      constraints: BoxConstraints.tight(
                                        const Size(275, 30),
                                      ),
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
                                Row(
                                  children: <Widget>[
                                    Text(
                                      'Last synced: never!!!',
                                      style: Theme.of(context).textTheme.displaySmall,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SliverPadding(padding: EdgeInsets.only(top: 10)),
                  SliverGrid.builder(
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 500,
                      mainAxisExtent: 140,
                      mainAxisSpacing: 16,
                    ),
                    itemBuilder: (BuildContext context, int id) => BrowserCard(
                      card: browserViewModel.scoresheetCards[id],
                    ),
                    itemCount: browserViewModel.scoresheetCards.length,
                  ),
                  if (browserViewModel.hasMore)
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 48),
                        child: Center(
                          child: CircularProgressIndicator(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                      ),
                    ),
                  const SliverPadding(padding: EdgeInsets.only(bottom: 698)),
                ],
              ),
            ),
          ),
        ),
      );
}
