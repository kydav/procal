import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:procal/constants/strings.dart';
import 'package:procal/pages/home/welcome/welcome_controller.dart';

class WeightPage extends HookConsumerWidget {
  const WeightPage({required this.pageDisabled, super.key});
  final ValueNotifier<bool> pageDisabled;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weightController = useTextEditingController();
    final weightUnit = useState(WeightUnit.lb);
    final heightControllerCmOrFt = useTextEditingController();
    final heightControllerInches = useTextEditingController();
    final heightUnit = useState(HeightUnit.imperial);

    return SingleChildScrollView(
      child: Column(
        children: [
          Text(WelcomeStrings.aLittleMorePersonal),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(WelcomeStrings.height),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            spacing: 10.0,
            children: [
              Expanded(
                child: TextField(
                  controller: weightController,
                  textInputAction: TextInputAction.next,
                  onEditingComplete: () => FocusScope.of(context).nextFocus(),
                  onChanged: (_) => {},
                  autofillHints: const [AutofillHints.givenName],
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                    labelText: weightUnit.value == WeightUnit.lb
                        ? WelcomeStrings.lbs
                        : WelcomeStrings.kg,
                    border: const OutlineInputBorder(),
                  ),
                ),
              ),
              DropdownButton<WeightUnit>(
                value: weightUnit.value,
                items: const [
                  DropdownMenuItem(value: WeightUnit.lb, child: Text('lbs')),
                  DropdownMenuItem(value: WeightUnit.kg, child: Text('kg')),
                ],
                onChanged: (value) {
                  if (value != null) {
                    weightUnit.value = value;
                  }
                },
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(WelcomeStrings.height),
            ),
          ),
          Row(
            spacing: 10.0,
            children: [
              Expanded(
                child: TextField(
                  controller: heightControllerCmOrFt,
                  textInputAction: TextInputAction.next,
                  onEditingComplete: () => FocusScope.of(context).nextFocus(),
                  onChanged: (_) => {},
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                    labelText: heightUnit.value == HeightUnit.imperial
                        ? WelcomeStrings.feet
                        : WelcomeStrings.cm,
                    border: const OutlineInputBorder(),
                  ),
                ),
              ),
              if (heightUnit.value == HeightUnit.imperial) ...[
                Expanded(
                  child: TextField(
                    controller: heightControllerInches,
                    textInputAction: TextInputAction.next,
                    onEditingComplete: () => FocusScope.of(context).nextFocus(),
                    onChanged: (_) => {},
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: InputDecoration(
                      labelText: WelcomeStrings.inches,
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
              DropdownButton<HeightUnit>(
                value: heightUnit.value,
                items: const [
                  DropdownMenuItem(
                    value: HeightUnit.imperial,
                    child: Text('Imperial'),
                  ),
                  DropdownMenuItem(
                    value: HeightUnit.metric,
                    child: Text('Metric'),
                  ),
                ],
                onChanged: (value) {
                  if (value != null) {
                    heightUnit.value = value;
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
