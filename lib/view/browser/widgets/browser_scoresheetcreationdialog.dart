import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/target/target.dart';
import '../../../util/scoresheet/scoresheet_model.dart';
import '../../editor/editor_view.dart';

class BrowserScoresheetCreationDialog extends StatefulWidget {
  const BrowserScoresheetCreationDialog({super.key});

  @override
  State<BrowserScoresheetCreationDialog> createState() =>
      _BrowserScoresheetCreationDialogState();
}

class _BrowserScoresheetCreationDialogState
    extends State<BrowserScoresheetCreationDialog> {
  final TextEditingController _nameController = TextEditingController();
  Target? _selectedTarget = Target.USA();
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
                    onSelected: (Target? target) => _selectedTarget = target,
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
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute<EditorView>(
                      builder:
                          (_) => ListenableProvider<ScoresheetModel>.value(
                            value: Provider.of<ScoresheetModel>(
                              context,
                              listen: false,
                            ),
                            child: EditorView(
                              scoresheetIndex: Provider.of<ScoresheetModel>(
                                context,
                                listen: false,
                              ).createScoresheet(
                                _nameController.value.text,
                                int.parse(_shotsPerEndController.value.text),
                                int.parse(_endsController.value.text),
                                _selectedTarget!,
                              ),
                            ),
                          ),
                    ),
                  );
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
