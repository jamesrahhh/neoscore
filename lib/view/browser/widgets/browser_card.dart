import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../editor/editor_view.dart';
import '../../editor/scoresheet_model.dart';
import '../../navigation/scoresheet_managermodel.dart';
import '../../widgets/score_row.dart';

class BrowserCard extends StatelessWidget {
  const BrowserCard({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: ColoredBox(
        color: Theme.of(context).colorScheme.surfaceContainer,
        child: Column(
          children: <Widget>[
            InkWell(
              onTap:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute<EditorView>(
                      builder:
                          (_) =>
                              ListenableProvider<ScoresheetManagerModel>.value(
                                value: Provider.of<ScoresheetManagerModel>(
                                  context,
                                  listen: false,
                                ),
                                child: EditorView(scoresheetIndex: index),
                              ),
                    ),
                  ),

              child: Padding(
                padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(
                        Provider.of<ScoresheetModel>(
                          context,
                          listen: false,
                        ).name,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    const Icon(Icons.more_vert),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 24, right: 24, top: 4, bottom: 4),
              child: Divider(),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Column(
                children: List<Widget>.generate(
                  2,
                  (int endIndex) => ScoreRow(
                    endIndex:
                        Provider.of<ScoresheetModel>(context).getLastEnd == 0
                            ? endIndex
                            : Provider.of<ScoresheetModel>(context).getLastEnd +
                                endIndex -
                                1,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
