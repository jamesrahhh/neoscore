import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../browser/browser_viewmodel.dart';
import 'editor_viewmodel.dart';
import 'widgets/editor_keyboard.dart';
import 'widgets/editor_row.dart';

class EditorView extends StatelessWidget {
  const EditorView({super.key});

  @override
  Widget build(BuildContext context) => PopScope(
        onPopInvokedWithResult: (bool didPop, _) async {
          Navigator.of(context).pop();
          Provider.of<BrowserViewModel>(context, listen: false)
              .updateScoresheet(
            scoresheet:
                Provider.of<EditorViewModel>(context, listen: false).scoresheet,
          );
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Scoresheet saved'),
              duration: Duration(seconds: 2),
            ),
          );
        },
        canPop: false,
        child: Scaffold(
          body: CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: <Widget>[
              SliverAppBar(
                centerTitle: true,
                title: Column(
                  children: <Widget>[
                    Text(
                      Provider.of<EditorViewModel>(
                        context,
                        listen: false,
                      ).scoresheet.name,
                    ),
                    Consumer<EditorViewModel>(
                      builder: (BuildContext context,
                              EditorViewModel editorViewModel, _) =>
                          Text(
                              'Average arrow: ${editorViewModel.getAverageArrow().toStringAsPrecision(4)}',
                              style: Theme.of(context).textTheme.displaySmall),
                    ),
                  ],
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.only(
                    top: 4, left: 16, right: 16, bottom: 8),
                sliver: SliverGrid.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 500,
                    mainAxisExtent: 66,
                    crossAxisSpacing: 4,
                  ),
                  itemCount: Provider.of<EditorViewModel>(
                    context,
                    listen: false,
                  ).scoresheet.ends,
                  itemBuilder: (BuildContext context, int endIndex) => InkWell(
                    onTap: () => showModalBottomSheet<void>(
                      context: context,
                      builder: (_) => ListenableProvider<EditorViewModel>.value(
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
                        builder: (_, EditorViewModel editorViewModel, __) =>
                            Text(
                          '${editorViewModel.getSingleScore(score: editorViewModel.scoresheet.target.formattedScores.length - 1)}',
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
                            builder: (_, EditorViewModel editorViewModel, __) =>
                                Text('${editorViewModel.getTotalScore}'),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SliverPadding(padding: EdgeInsets.only(top: 20)),
            ],
          ),
        ),
      );
}
