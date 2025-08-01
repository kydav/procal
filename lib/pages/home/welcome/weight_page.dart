import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:procal/constants/strings.dart';

class WeightPage extends HookConsumerWidget {
  const WeightPage({required this.pageDisabled, super.key});
  final ValueNotifier<bool> pageDisabled;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weightController = useTextEditingController();
    final heightControllerMetric = useTextEditingController();
    final heightControllerImperialFeet = useTextEditingController();
    final heightControllerImperialInches = useTextEditingController();
    final heightUnit = useState('metric'); // 'metric' or 'imperial'

    return SingleChildScrollView(
      child: Column(
        spacing: 20.0,
        children: [
          Text(WelcomeStrings.aLittleMorePersonal),
          Row(
            children: [
              TextField(
                controller: weightController,
                textInputAction: TextInputAction.next,
                onEditingComplete: () => FocusScope.of(context).nextFocus(),
                onChanged: (_) => {},
                autofillHints: const [AutofillHints.givenName],
                decoration: InputDecoration(
                  labelText: WelcomeStrings.firstName,
                  border: const OutlineInputBorder(),
                ),
              ),
              const SizedBox(width: 10),
              DropdownButton<String>(
                value: heightUnit.value,
                items: [
                  DropdownMenuItem(
                    value: 'metric',
                    child: Text(WelcomeStrings.metric),
                  ),
                  DropdownMenuItem(
                    value: 'imperial',
                    child: Text(WelcomeStrings.imperial),
                  ),
                ],
                onChanged: (value) {
                  if (value != null) {
                    heightUnit.value = value;
                    pageDisabled.value =
                        false; // Enable next button when a unit is selected
                  }
                },
              ),
            ],
          ),

          // TextField(
          //   controller: lastNameController,
          //   textInputAction: TextInputAction.next,
          //   onChanged: (_) => checkDisabled(),
          //   onEditingComplete: () => FocusScope.of(context).nextFocus(),
          //   autofillHints: const [AutofillHints.familyName],
          //   decoration: InputDecoration(
          //     labelText: WelcomeStrings.lastName,
          //     border: const OutlineInputBorder(),
          //   ),
          // ),
          // TextField(
          //   controller: ageController,
          //   textInputAction: TextInputAction.next,
          //   onChanged: (_) => checkDisabled(),
          //   onEditingComplete: () => FocusScope.of(context).nextFocus(),
          //   keyboardType: TextInputType.number,
          //   inputFormatters: <TextInputFormatter>[
          //     FilteringTextInputFormatter.digitsOnly,
          //   ],
          //   decoration: InputDecoration(
          //     labelText: WelcomeStrings.age,
          //     border: const OutlineInputBorder(),
          //   ),
          // ),
        ],
      ),
    );
  }
}
