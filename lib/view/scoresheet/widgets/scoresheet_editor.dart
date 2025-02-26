import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../scoresheet_viewmodel.dart';

class ScoresheetEditor extends StatelessWidget {
  const ScoresheetEditor({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
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
  );
}
