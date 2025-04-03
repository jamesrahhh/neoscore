import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/target/target.dart';
import '../scoresheet_editorview.dart';
import '../scoresheet_model.dart';

class ScoresheetCreateDialog extends StatelessWidget {
  const ScoresheetCreateDialog({super.key});

  @override
  Widget build(BuildContext context) => Dialog(
    child: TextButton(
      onPressed:
          () => Navigator.pushReplacement(
            context,
            MaterialPageRoute<ScoresheetEditorView>(
              builder:
                  (_) => ListenableProvider<ScoresheetModel>.value(
                    value: Provider.of<ScoresheetModel>(context, listen: false),
                    child: ScoresheetEditorView(
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
