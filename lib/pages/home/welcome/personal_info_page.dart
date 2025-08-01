import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:procal/constants/strings.dart';
import 'package:procal/pages/home/welcome/welcome_controller.dart';

class PersonalInfoPage extends HookConsumerWidget {
  const PersonalInfoPage({required this.pageDisabled, super.key});
  final ValueNotifier<bool> pageDisabled;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final welcomeState = ref.watch(welcomeControllerProvider);
    final firstNameController = useTextEditingController(
      text: welcomeState.firstName,
    );
    final lastNameController = useTextEditingController(
      text: welcomeState.lastName,
    );
    final ageController = useTextEditingController(text: welcomeState.age);
    final welcomeController = ref.read(welcomeControllerProvider.notifier);

    void checkDisabled() {
      welcomeController
        ..setFirstName(firstNameController.value.text)
        ..setLastName(lastNameController.value.text)
        ..setAge(ageController.value.text);
      if (firstNameController.value.text.isEmpty ||
          ageController.value.text.isEmpty) {
        pageDisabled.value = true;
      } else {
        pageDisabled.value = false;
      }
    }

    return SingleChildScrollView(
      child: Column(
        spacing: 20.0,
        children: [
          Text(WelcomeStrings.welcome),
          Text(WelcomeStrings.letsGetToKnowYou),
          TextField(
            controller: firstNameController,
            textInputAction: TextInputAction.next,
            onEditingComplete: () => FocusScope.of(context).nextFocus(),
            onChanged: (_) => checkDisabled(),
            autofillHints: const [AutofillHints.givenName],
            decoration: InputDecoration(
              labelText: WelcomeStrings.firstName,
              border: const OutlineInputBorder(),
            ),
          ),
          TextField(
            controller: lastNameController,
            textInputAction: TextInputAction.next,
            onChanged: (_) => checkDisabled(),
            onEditingComplete: () => FocusScope.of(context).nextFocus(),
            autofillHints: const [AutofillHints.familyName],
            decoration: InputDecoration(
              labelText: WelcomeStrings.lastName,
              border: const OutlineInputBorder(),
            ),
          ),
          TextField(
            controller: ageController,
            textInputAction: TextInputAction.next,
            onChanged: (_) => checkDisabled(),
            onEditingComplete: () => FocusScope.of(context).nextFocus(),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly,
            ],
            decoration: InputDecoration(
              labelText: WelcomeStrings.age,
              border: const OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }
}
