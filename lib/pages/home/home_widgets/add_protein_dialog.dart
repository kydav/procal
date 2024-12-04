import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:procal/constants/strings.dart';
import 'package:procal/top_level_providers.dart';

class AddProteinDialog extends HookConsumerWidget {
  const AddProteinDialog({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final proteinController = useTextEditingController();
    final healthService = ref.read(healthServiceProvider);
    final proteinConsumed = ref.read(proteinConsumedProvider.notifier);
    final focusNode = useFocusNode();
    useEffect(() {
      focusNode.requestFocus();
      return null;
    }, []);
    return Dialog(
      insetPadding:
          const EdgeInsets.only(left: 20, top: 100, right: 20, bottom: 100),
      child: Container(
        padding:
            const EdgeInsets.only(left: 30, top: 58, right: 30, bottom: 30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(Strings.dialogProteinGoal),
            TextField(
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              controller: proteinController,
              focusNode: focusNode,
            ),
            TextButton(
              child: Text(Strings.generalSubmit),
              onPressed: () {
                final value = proteinController.text;
                if (int.tryParse(proteinController.text) != null) {
                  final intValue = int.parse(value);
                  healthService.submitProtein(intValue);
                  final current = proteinConsumed.state ?? 0;
                  proteinConsumed.state = current + intValue;
                }

                // storageService.storeValue(
                //     SystemStrings, proteinController.value.text);
                // proteinGoal
                //     .update((_) => int.tryParse(proteinController.value.text));

                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
