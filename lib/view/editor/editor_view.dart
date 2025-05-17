import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'editor_viewmodel.dart';
import 'widgets/editor_keyboard.dart';
import 'widgets/editor_row.dart';

class EditorView extends StatelessWidget {
  const EditorView({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    body: CustomScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      slivers: <Widget>[
        SliverAppBar(
          centerTitle: true,
          title: Text(
            Provider.of<EditorViewModel>(context, listen: false).name,
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          sliver: SliverGrid.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 500,
              mainAxisExtent: 66,
              crossAxisSpacing: 4,
            ),
            itemCount:
                Provider.of<EditorViewModel>(context, listen: false).ends,
            itemBuilder:
                (BuildContext context, int endIndex) => InkWell(
                  onTap:
                      () => showModalBottomSheet<void>(
                        context: context,
                        builder:
                            (_) => ListenableProvider<EditorViewModel>.value(
                              value: Provider.of<EditorViewModel>(
                                context,
                                listen: false,
                              ),
                              child: EditorKeyboard(endIndex: endIndex),
                            ),
                      ),
                  child: EditorRow(endIndex: endIndex),
                ),
          ),
        ),
        SliverToBoxAdapter(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Align(
                alignment: Alignment.centerRight,
                child: Consumer<EditorViewModel>(
                  builder:
                      (_, EditorViewModel editorViewModel, __) => Text(
                        '${editorViewModel.getSingleScore(score: editorViewModel.target.formattedScores.length - 1)}',
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: SizedBox(
                  height: 54,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Consumer<EditorViewModel>(
                      builder:
                          (_, EditorViewModel editorViewModel, __) =>
                              Text('${editorViewModel.getTotalScore}'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
