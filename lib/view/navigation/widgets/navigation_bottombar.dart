import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../navigation_viewmodel.dart';

class NavigationBottomBar extends StatefulWidget {
  const NavigationBottomBar({super.key});

  @override
  State<NavigationBottomBar> createState() => _NavigationBottomBarState();
}

class _NavigationBottomBarState extends State<NavigationBottomBar> {
  final List<IconData> _icons = const <IconData>[Icons.notes, Icons.settings];

  @override
  Widget build(BuildContext context) => Container(
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
            onTap:
                () => Provider.of<NavigationViewModel>(
                  context,
                  listen: false,
                ).setPage(index),
            child: Consumer<NavigationViewModel>(
              builder:
                  (BuildContext context, NavigationViewModel model, _) => Icon(
                    _icons[index],
                    size: index == model.pageIndex ? 28 : 24,
                    color:
                        index == model.pageIndex
                            ? Theme.of(context).textTheme.displayLarge!.color
                            : Theme.of(context).iconTheme.color,
                  ),
            ),
          ),
        ),
      ),
    ),
  );
}
