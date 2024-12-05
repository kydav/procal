import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:procal/constants/strings.dart';
import 'package:procal/constants/system_strings.dart';
import 'package:procal/top_level_providers.dart';

class CommonDialog extends HookConsumerWidget {
  const CommonDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final storageService = ref.read(localStorageServiceProvider);
    final proteinController = useTextEditingController();
    final proteinGoal = ref.watch(proteinGoalProvider.notifier);
    return Dialog(
      insetPadding:
          const EdgeInsets.only(left: 20, top: 100, right: 20, bottom: 100),
      child: Container(
        padding:
            const EdgeInsets.only(left: 30, top: 58, right: 30, bottom: 30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(DialogStrings.proteinGoal),
            TextField(
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              controller: proteinController,
            ),
            TextButton(
              child: Text(GeneralStrings.submit),
              onPressed: () {
                storageService.storeValue(
                    SystemStrings.proteinGoal, proteinController.value.text);
                proteinGoal
                    .update((_) => int.tryParse(proteinController.value.text));

                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
