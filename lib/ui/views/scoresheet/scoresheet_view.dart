import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/scoresheet_view/scoresheet_card.dart';
import 'scoresheet_viewmodel.dart';

class ScoresheetView extends StatelessWidget {
  const ScoresheetView({super.key});

  @override
  Widget build(BuildContext context) =>
      ChangeNotifierProvider<ScoresheetViewModel>(
          create: (_) => ScoresheetViewModel(),
          builder: (BuildContext context, _) => Scrollbar(
                thickness: 8.0,
                radius: const Radius.circular(4.0),
                interactive: true,
                child: CustomScrollView(
                  slivers: <Widget>[
                    const SliverAppBar(
                      flexibleSpace: Placeholder(),
                      floating: true,
                      title: Text('Title'),
                    ),
                    const SliverPadding(
                        padding: EdgeInsets.fromLTRB(0.0, 14.0, 0.0, 0.0)),
                    SliverGrid.builder(
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 500.0,
                        mainAxisExtent: 160.0,
                        mainAxisSpacing: 8.0,
                        crossAxisSpacing: 8.0,
                      ),
                      itemBuilder: (BuildContext context, int index) =>
                          ScoresheetCard(index: index),
                      itemCount: Provider.of<ScoresheetViewModel>(context)
                          .getScoresheetAmount,
                    ),
                  ],
                ),
              ));
}
