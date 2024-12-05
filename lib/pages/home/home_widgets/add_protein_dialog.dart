import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:procal/common/form_field_title.dart';
import 'package:procal/constants/strings.dart';
import 'package:procal/top_level_providers.dart';

class AddProteinDialog extends HookConsumerWidget {
  const AddProteinDialog({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final proteinController = useTextEditingController();
    final caloriesController = useTextEditingController();
    final healthService = ref.read(healthServiceProvider);
    final proteinConsumed = ref.read(proteinConsumedProvider.notifier);
    final proteinFocusNode = useFocusNode();
    final caloriesFocusNode = useFocusNode();
    useEffect(() {
      proteinFocusNode.requestFocus();
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
            FormFieldTitle(
              title: DialogStrings.mealProtein,
              child: TextField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                controller: proteinController,
                focusNode: proteinFocusNode,
                onEditingComplete: () => caloriesFocusNode.requestFocus,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(4)
                ],
              ),
            ),
            FormFieldTitle(
              title: DialogStrings.mealCalories,
              child: TextField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                controller: caloriesController,
                focusNode: caloriesFocusNode,
                onEditingComplete: () {},
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(4)
                ],
              ),
            ),
            TextButton(
              child: Text(GeneralStrings.submit),
              onPressed: () async {
                final proteinValue = proteinController.text;
                if (int.tryParse(proteinValue) != null) {
                  final proteinIntValue = int.parse(proteinValue);
                  await healthService.submitProtein(proteinIntValue);
                  //final current = proteinConsumed.state ?? 0;
                  //proteinConsumed.state = current + intValue;
                }
                final caloriesValue = caloriesController.text;
                if (int.tryParse(caloriesValue) != null) {
                  final caloriesIntValue = int.parse(caloriesValue);
                  await healthService.submitCalories(caloriesIntValue);
                }

                // storageService.storeValue(
                //     SystemStrings, proteinController.value.text);
                // proteinGoal
                //     .update((_) => int.tryParse(proteinController.value.text));
                if (context.mounted) {
                  ref.read(procalRouterProvider).pop();
                  //Navigator.pop(context);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
