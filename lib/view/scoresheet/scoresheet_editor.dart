import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'scoresheet_model.dart';
import 'scoresheet_viewmodel.dart';
import 'widgets/score_keyboard.dart';
import 'widgets/score_row.dart';

class ScoresheetEditor extends StatelessWidget {
  const ScoresheetEditor({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          centerTitle: true,
          title: const Text('Editor'),
          leading: IconButton(
            onPressed:
                () => Provider.of<ScoresheetViewModel>(
                  context,
                  listen: false,
                ).setPage(0),
            icon: const Icon(Icons.arrow_left),
          ),
        ),
        SliverGrid.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 500,
            mainAxisExtent: 48.0,
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 4.0,
          ),
          itemCount:
              Provider.of<ScoresheetModel>(context, listen: false)
                  .getScoresheet(
                    Provider.of<ScoresheetModel>(
                      context,
                      listen: false,
                    ).scoresheetIndex,
                  )
                  .ends,
          itemBuilder:
              (BuildContext context, int endIndex) => InkWell(
                onTap:
                    () => showModalBottomSheet<void>(
                      context: context,
                      builder:
                          (_) => ListenableProvider<ScoresheetModel>.value(
                            value: Provider.of<ScoresheetModel>(
                              context,
                              listen: false,
                            ),
                            child: ScoreKeyboard(endIndex: endIndex),
                          ),
                    ),
                child: ScoreRow(
                  scoresheetIndex:
                      Provider.of<ScoresheetModel>(
                        context,
                        listen: false,
                      ).scoresheetIndex,
                  endIndex: endIndex,
                ),
              ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 44,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 6.0),
                  child: SizedBox(
                    width: 24,
                    child: Text(
                      '${Provider.of<ScoresheetModel>(context).getCurrentScoresheet().getSingleScore(Provider.of<ScoresheetModel>(context, listen: false).getCurrentTarget().formattedScores.length - 1)}',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 6.0, right: 14.0),
                  child: SizedBox(
                    width: 34,
                    child: Text(
                      '${Provider.of<ScoresheetModel>(context).getCurrentScoresheet().getTotalScore}',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
