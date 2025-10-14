import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/scoresheet/scoresheet.dart';
import '../../../common/target/target.dart';
import '../../editor/editor_view.dart';
import '../browser_viewmodel.dart';

class BrowserScoresheetCreationDialog extends HookConsumerWidget {
  const BrowserScoresheetCreationDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final BrowserViewModel browserViewModel = ref.watch(browserViewModelProvider.notifier);
    final TextEditingController nameController = useTextEditingController();
    final TextEditingController targetController = useTextEditingController();
    final TextEditingController endsController = useTextEditingController();
    final TextEditingController shotsPerEndController = useTextEditingController();

    return Dialog(
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
                      controller: nameController,
                      style: Theme.of(context).textTheme.bodyMedium,
                      decoration: const InputDecoration(labelText: 'Name'),
                    ),
                    DropdownMenu<Target>(
                      width: 500,
                      hintText: 'Target',
                      controller: targetController,
                      dropdownMenuEntries: List<DropdownMenuEntry<Target>>.generate(
                        Target.getTargets.length,
                        (int index) => DropdownMenuEntry<Target>(
                          value: Target.getTargets[index],
                          label: Target.getTargets[index].formattedName,
                        ),
                      ),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: endsController,
                      style: Theme.of(context).textTheme.bodyMedium,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.list_alt),
                        labelText: 'Number of ends',
                      ),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: shotsPerEndController,
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
                    final Scoresheet scoresheet = await browserViewModel.createScoresheet(
                      name: nameController.value.text,
                      target: Target.fromFormattedName(
                        targetController.value.text,
                      ),
                      ends: int.parse(endsController.value.text),
                      shotsPerEnd: int.parse(shotsPerEndController.value.text),
                    );
                    if (context.mounted) {
                      await Navigator.pushReplacement(
                        context,
                        MaterialPageRoute<EditorView>(
                          builder: (_) => EditorView(scoresheet: scoresheet),
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
}
