import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../util/scoresheet/scoresheet_model.dart';
import '../../navigation/widgets/navigation_bottombar.dart';
import 'browser_scoresheetcreationdialog.dart';

class BrowserBottomBar extends StatelessWidget {
  const BrowserBottomBar({super.key});

  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    spacing: 16,
    children: <Widget>[
      const NavigationBottomBar(),
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
          onTap:
              () => showDialog<void>(
                context: context,
                builder:
                    (_) => ListenableProvider<ScoresheetModel>.value(
                      value: Provider.of<ScoresheetModel>(
                        context,
                        listen: false,
                      ),
                      child: const BrowserScoresheetCreationDialog(),
                    ),
              ),
          child: Icon(Icons.add, color: Theme.of(context).colorScheme.surface),
        ),
      ),
    ],
  );
}
