import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/scoresheet/scoresheet.dart';
import '../../../common/target/target.dart';
import '../../editor/editor_view.dart';
import '../../editor/editor_viewmodel.dart';
import '../browser_viewmodel.dart';

class BrowserScoresheetCreationDialog extends StatefulWidget {
  const BrowserScoresheetCreationDialog({super.key});

  @override
  State<BrowserScoresheetCreationDialog> createState() =>
      _BrowserScoresheetCreationDialogState();
}

class _BrowserScoresheetCreationDialogState
    extends State<BrowserScoresheetCreationDialog> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _targetController = TextEditingController();
  final TextEditingController _endsController = TextEditingController();
  final TextEditingController _shotsPerEndController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _endsController.dispose();
    _shotsPerEndController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Dialog(
    child: SizedBox(
      height: 500,
      child: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                spacing: 8,
                children: <Widget>[
                  const Text('New scoresheet'),
                  TextFormField(
                    controller: _nameController,
                    style: Theme.of(context).textTheme.bodyMedium,
                    decoration: const InputDecoration(labelText: 'Name'),
                  ),
                  DropdownMenu<Target>(
                    width: 500,
                    hintText: 'Target',
                    controller: _targetController,
                    dropdownMenuEntries:
                        List<DropdownMenuEntry<Target>>.generate(
                          Target.getTargets.length,
                          (int index) => DropdownMenuEntry<Target>(
                            value: Target.getTargets[index],
                            label: Target.getTargets[index].formattedName,
                          ),
                        ),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _endsController,
                    style: Theme.of(context).textTheme.bodyMedium,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.list_alt),
                      labelText: 'Number of ends',
                    ),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _shotsPerEndController,
                    style: Theme.of(context).textTheme.bodyMedium,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.arrow_outward),
                      labelText: 'Arrows per end',
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).textTheme.titleLarge!.color,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
              ),
              child: TextButton(
                onPressed: () async {
                  final Scoresheet scoresheet = await Provider.of<
                    BrowserViewModel
                  >(context, listen: false).createScoresheet(
                    name: _nameController.value.text,
                    target: Target.fromFormattedName(
                      _targetController.value.text,
                    ),
                    ends: int.parse(_endsController.value.text),
                    shotsPerEnd: int.parse(_shotsPerEndController.value.text),
                  );
                  if (context.mounted) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute<EditorView>(
                        builder: (_) {
                          return ListenableProvider<BrowserViewModel>.value(
                            value: Provider.of<BrowserViewModel>(
                              context,
                              listen: false,
                            ),
                            child: ChangeNotifierProvider<EditorViewModel>(
                              create:
                                  (_) =>
                                      EditorViewModel(scoresheet: scoresheet),
                              builder:
                                  (BuildContext context, _) =>
                                      const EditorView(),
                            ),
                          );
                        },
                      ),
                    );
                  }
                },
                child: Text(
                  'Create scoresheet',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.surface,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
