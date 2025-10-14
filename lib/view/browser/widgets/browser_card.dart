import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common/scoresheet/scoresheet.dart';
import '../../../common/scoresheet/scoresheet_card.dart';
import '../../editor/editor_view.dart';
import '../browser_viewmodel.dart';

class BrowserCard extends ConsumerWidget {
  const BrowserCard({required this.card, super.key});

  final ScoresheetCard card;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final BrowserViewModel browserViewModel = ref.watch(browserViewModelProvider.notifier);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: DecoratedBox(
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Theme.of(context).colorScheme.shadow,
              spreadRadius: 1,
              blurRadius: 6,
            ),
          ],
          color: Theme.of(context).colorScheme.surfaceContainer,
          borderRadius: const BorderRadius.all(Radius.circular(3)),
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
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
                              await browserViewModel.queryScoresheet(id: card.id);
                          if (context.mounted) {
                            await Navigator.push(
                              context,
                              MaterialPageRoute<EditorView>(
                                builder: (_) => EditorView(scoresheet: scoresheet),
                              ),
                            );
                          }
                        },
                        child: const Text('Edit'),
                      ),
                      MenuItemButton(
                        onPressed: () => browserViewModel.deleteScoresheet(id: card.id),
                        child: const Text('Delete'),
                      ),
                    ],
                    builder: (BuildContext context, MenuController menuController, _) => InkWell(
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
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Divider(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'target: ${card.target.formattedName.toLowerCase()}, ends: ${card.ends}',
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<ScoresheetCard>('card', card));
  }
}
