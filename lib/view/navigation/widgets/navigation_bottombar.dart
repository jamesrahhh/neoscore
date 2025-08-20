import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../browser/browser_viewmodel.dart';
import '../../browser/widgets/browser_scoresheetcreationdialog.dart';
import '../navigation_viewmodel.dart';

class NavigationBottomBar extends StatefulWidget {
  const NavigationBottomBar({super.key});

  @override
  State<NavigationBottomBar> createState() => _NavigationBottomBarState();
}

class _NavigationBottomBarState extends State<NavigationBottomBar> {
  final List<IconData> _icons = const <IconData>[Icons.notes, Icons.settings];

  @override
  Widget build(BuildContext context) => Consumer<NavigationViewModel>(
        builder: (BuildContext context, NavigationViewModel model, _) => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 16,
          children: <Widget>[
            if (model.pageIndex == 0)
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
                      onTap: () => Provider.of<NavigationViewModel>(
                        context,
                        listen: false,
                      ).setPage(index),
                      child: Icon(
                        _icons[index],
                        size: index == model.pageIndex ? 28 : 24,
                        color: index == model.pageIndex
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
            if (model.pageIndex == 0)
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
                    builder: (_) => ListenableProvider<BrowserViewModel>.value(
                      value: Provider.of<BrowserViewModel>(
                        context,
                        listen: false,
                      ),
                      child: const BrowserScoresheetCreationDialog(),
                    ),
                  ),
                  child: Icon(
                    Icons.add,
                    color: Theme.of(context).colorScheme.surface,
                  ),
                ),
              ),
          ],
        ),
      );
}
