import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:procal/common/form_field_title.dart';
import 'package:procal/constants/strings.dart';
import 'package:procal/procal_router.dart';
import 'package:procal/top_level_providers.dart';

class AddProteinDialog extends HookConsumerWidget {
  const AddProteinDialog({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final proteinController = useTextEditingController();
    final proteinUpdate = useValueListenable(proteinController);
    final caloriesController = useTextEditingController();
    final caloriesUpdate = useValueListenable(caloriesController);
    final healthService = ref.read(healthServiceProvider);
    final proteinFocusNode = useFocusNode();
    final caloriesFocusNode = useFocusNode();
    final isValid = useState(false);
    useEffect(() {
      if (proteinController.text.isNotEmpty &&
          caloriesController.text.isNotEmpty) {
        isValid.value = true;
      } else {
        isValid.value = false;
      }
      return null;
    }, [proteinUpdate, caloriesUpdate]);

    useEffect(() {
      proteinFocusNode.requestFocus();
      return null;
    }, []);
    return Dialog(
      insetPadding: const EdgeInsets.only(
        left: 20,
        top: 100,
        right: 20,
        bottom: 100,
      ),
      child: Container(
        padding: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                alignment: Alignment.topRight,
                icon: const Icon(Icons.close),
                onPressed: () => ref.read(procalRouterProvider).pop(),
              ),
            ),
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
                  LengthLimitingTextInputFormatter(4),
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
                  LengthLimitingTextInputFormatter(4),
                ],
              ),
            ),
            TextButton(
              onPressed: isValid.value
                  ? () async {
                      final proteinValue = proteinController.text;
                      if (int.tryParse(proteinValue) != null) {
                        final proteinIntValue = int.parse(proteinValue);
                        await healthService.submitProtein(proteinIntValue);
                      }
                      final caloriesValue = caloriesController.text;
                      if (int.tryParse(caloriesValue) != null) {
                        final caloriesIntValue = int.parse(caloriesValue);
                        await healthService.submitCalories(caloriesIntValue);
                      }
                      if (context.mounted) {
                        ref.read(procalRouterProvider).pop();
                      }
                    }
                  : null,
              child: Text(GeneralStrings.submit),
            ),
          ],
        ),
      ),
    );
  }
}
