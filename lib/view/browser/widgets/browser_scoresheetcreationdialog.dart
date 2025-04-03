import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/target/target.dart';
import '../../../util/scoresheet/scoresheet_model.dart';
import '../../editor/editor_view.dart';

class BrowserScoresheetCreationDialog extends StatelessWidget {
  const BrowserScoresheetCreationDialog({super.key});

  @override
  Widget build(BuildContext context) => Dialog(
    child: TextButton(
      onPressed:
          () => Navigator.pushReplacement(
            context,
            MaterialPageRoute<EditorView>(
              builder:
                  (_) => ListenableProvider<ScoresheetModel>.value(
                    value: Provider.of<ScoresheetModel>(context, listen: false),
                    child: EditorView(
                      scoresheetIndex: Provider.of<ScoresheetModel>(
                        context,
                        listen: false,
                      ).createScoresheet(6, 20, Target.USA()),
                    ),
                  ),
            ),
          ),

      child: const Text('Add scoresheet'),
    ),
  );
}
