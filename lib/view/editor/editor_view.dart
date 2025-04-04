import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common/widgets/score_row.dart';
import '../../util/scoresheet/scoresheet_model.dart';
import 'widgets/editor_keyboard.dart';

class EditorView extends StatelessWidget {
  const EditorView({super.key, required this.scoresheetIndex});

  final int scoresheetIndex;

  @override
  Widget build(BuildContext context) => Scaffold(
    body: CustomScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      slivers: <Widget>[
        SliverAppBar(
          centerTitle: true,
          title: Text(
            Provider.of<ScoresheetModel>(
              context,
            ).getScoresheet(scoresheetIndex).name,
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
                Provider.of<ScoresheetModel>(
                  context,
                  listen: false,
                ).getScoresheet(scoresheetIndex).ends,
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
                              child: EditorKeyboard(
                                scoresheetIndex: scoresheetIndex,
                                endIndex: endIndex,
                              ),
                            ),
                      ),
                  child: ScoreRow(
                    scoresheetIndex: scoresheetIndex,
                    endIndex: endIndex,
                  ),
                ),
          ),
        ),
        SliverToBoxAdapter(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Align(
                alignment: Alignment.centerRight,
                child: Consumer<ScoresheetModel>(
                  builder:
                      (_, ScoresheetModel scoresheetModel, __) => Text(
                        '${scoresheetModel.getScoresheet(scoresheetIndex).getSingleScore(scoresheetModel.getScoresheet(scoresheetIndex).target.formattedScores.length - 1)}',
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: SizedBox(
                  height: 54,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Consumer<ScoresheetModel>(
                      builder:
                          (_, ScoresheetModel scoresheetModel, __) => Text(
                            '${scoresheetModel.getScoresheet(scoresheetIndex).getTotalScore}',
                          ),
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
