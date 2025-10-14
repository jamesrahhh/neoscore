import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'browser_viewmodel.dart';
import 'widgets/browser_card.dart';

class BrowserView extends HookConsumerWidget {
  const BrowserView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<BrowserState> browserState = ref.watch(browserViewModelProvider);
    final ScrollController scrollController = useScrollController();

    useEffect(
      () {
        void onScroll() {
          if (scrollController.position.pixels >= scrollController.position.maxScrollExtent) {
            ref.read(browserViewModelProvider.notifier).loadMore();
          }
        }

        scrollController.addListener(onScroll);
        return () => scrollController.removeListener(onScroll);
      },
      <ScrollController>[scrollController],
    );

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      extendBodyBehindAppBar: true,
      body: browserState.when(
        data: (BrowserState state) => Scrollbar(
          controller: scrollController,
          thickness: 6,
          radius: const Radius.circular(3),
          interactive: true,
          child: CustomScrollView(
            controller: scrollController,
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
                  card: state.cards[id],
                ),
                itemCount: state.cards.length,
              ),
              if (state.hasMore && state.isLoading)
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
        loading: () => Padding(
          padding: const EdgeInsets.only(top: 48),
          child: Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ),
        error: (_, __) => Padding(
          padding: const EdgeInsets.only(top: 48),
          child: Center(
            child: Column(
              children: <Widget>[
                const Text('Error loading scoresheets'),
                TextButton(
                  onPressed: () => ref.invalidate(browserViewModelProvider),
                  child: const Text('Retry'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
