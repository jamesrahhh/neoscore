import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/scoresheet/scoresheet.dart';
import '../../../common/scoresheet/scoresheet_card.dart';
import '../../editor/editor_view.dart';
import '../../editor/editor_viewmodel.dart';
import '../browser_viewmodel.dart';

class BrowserCard extends StatelessWidget {
  const BrowserCard({super.key, required this.card});

  final ScoresheetCard card;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceContainer,
          borderRadius: const BorderRadius.all(Radius.circular(4)),
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      card.name,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  MenuAnchor(
                    menuChildren: <Widget>[
                      MenuItemButton(
                        onPressed: () async {
                          final Scoresheet scoresheet =
                              await Provider.of<BrowserViewModel>(
                                context,
                                listen: false,
                              ).queryScoresheet(id: card.id);
                          if (context.mounted) {
                            Navigator.push(
                              context,
                              MaterialPageRoute<EditorView>(
                                builder: (_) {
                                  return ListenableProvider<
                                    BrowserViewModel
                                  >.value(
                                    value: Provider.of<BrowserViewModel>(
                                      context,
                                      listen: false,
                                    ),
                                    child:
                                        ChangeNotifierProvider<EditorViewModel>(
                                          create:
                                              (_) => EditorViewModel(
                                                scoresheet: scoresheet,
                                              ),
                                          builder:
                                              (BuildContext context, _) =>
                                                  const EditorView(),
                                        ),
                                  );
                                },
                              ),
                            );
                          }
                        },
                        child: const Text('Edit'),
                      ),
                      MenuItemButton(
                        onPressed:
                            () => Provider.of<BrowserViewModel>(
                              context,
                              listen: false,
                            ).deleteScoresheet(id: card.id),
                        child: const Text('Delete'),
                      ),
                    ],
                    builder:
                        (_, MenuController menuController, __) => InkWell(
                          onTap: () {
                            if (menuController.isOpen) {
                              menuController.close();
                            } else {
                              menuController.open();
                            }
                          },
                          child: const Icon(Icons.more_vert),
                        ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 24, right: 24, top: 4, bottom: 4),
              child: Divider(),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Text(
                'target: ${card.target.formattedName.toLowerCase()}, ends: ${card.ends}',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
