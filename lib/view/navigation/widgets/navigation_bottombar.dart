import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../browser/widgets/browser_scoresheetcreationdialog.dart';
import '../navigation_viewmodel.dart';

class NavigationBottomBar extends ConsumerWidget {
  const NavigationBottomBar({super.key});

  static const List<IconData> _icons = <IconData>[Icons.notes, Icons.settings];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int pageIndex = ref.watch(navigationViewModelProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 16,
      children: <Widget>[
        if (pageIndex == 0)
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: Theme.of(context).textTheme.displayLarge!.color,
              boxShadow: <BoxShadow>[
                BoxShadow(
                  spreadRadius: 1,
                  blurRadius: 6,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ],
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: InkWell(
              onTap: () => VoidCallback,
              child: Icon(
                Icons.sync,
                color: Theme.of(context).colorScheme.surface,
              ),
            ),
          ),
        Container(
          width: _icons.length * 64,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            boxShadow: <BoxShadow>[
              BoxShadow(
                blurRadius: 5,
                spreadRadius: 2,
                color: Theme.of(context).colorScheme.primary,
              ),
            ],
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List<Widget>.generate(
              _icons.length,
              (int index) => SizedBox(
                height: 64,
                width: 64,
                child: InkWell(
                  onTap: () => ref.read(navigationViewModelProvider.notifier).setPage = index,
                  child: Icon(
                    _icons[index],
                    size: index == pageIndex ? 28 : 24,
                    color: index == pageIndex
                        ? Theme.of(
                            context,
                          ).textTheme.displayLarge!.color
                        : Theme.of(context).iconTheme.color,
                  ),
                ),
              ),
            ),
          ),
        ),
        if (pageIndex == 0)
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: Theme.of(context).textTheme.displayLarge!.color,
              boxShadow: <BoxShadow>[
                BoxShadow(
                  blurRadius: 5,
                  spreadRadius: 2,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ],
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: InkWell(
              onTap: () => showDialog<void>(
                context: context,
                builder: (_) => const BrowserScoresheetCreationDialog(),
              ),
              child: Icon(
                Icons.add,
                color: Theme.of(context).colorScheme.surface,
              ),
            ),
          ),
      ],
    );
  }
}
