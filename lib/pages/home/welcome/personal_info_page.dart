import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:procal/constants/strings.dart';
import 'package:procal/pages/home/welcome/welcome_page_state.dart';
import 'package:procal/pages/home/welcome/welcome_wrapper.dart';

class PersonalInfoPage extends HookConsumerWidget {
  const PersonalInfoPage({required this.pageController, super.key});
  final PageController pageController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final welcomeState = ref.watch(welcomePageStateProvider);
    final firstNameController = useTextEditingController(
      text: welcomeState.value?.firstName,
    );
    final lastNameController = useTextEditingController(
      text: welcomeState.value?.lastName,
    );
    final ageController = useTextEditingController(
      text: welcomeState.value?.age,
    );
    final gender = useState<String?>(
      welcomeState.value?.gender.isEmpty ?? true
          ? null
          : welcomeState.value?.gender,
    );
    final welcomeController = ref.read(welcomePageStateProvider.notifier);
    final nextDisabled = useState(true);

    void checkDisabled() {
      if (firstNameController.value.text.isEmpty ||
          ageController.value.text.isEmpty ||
          gender.value == null) {
        nextDisabled.value = true;
      } else {
        nextDisabled.value = false;
      }
    }

    useEffect(() {
      if (firstNameController.text.isNotEmpty &&
          ageController.text.isNotEmpty &&
          gender.value != null) {
        nextDisabled.value = false;
      } else {
        nextDisabled.value = true;
      }
      return null;
    }, []);

    return WelcomeWrapper(
      pageController: pageController,
      isNextDisabled: nextDisabled.value,
      showBackButton: false,
      onNextPressed: () async {
        welcomeController
          ..setFirstName(firstNameController.text)
          ..setLastName(lastNameController.text)
          ..setAge(ageController.text)
          ..setGender(gender.value!);
        await pageController.nextPage(
          duration: Durations.medium1,
          curve: Curves.bounceIn,
        );
      },
      child: Column(
        children: [
          SingleChildScrollView(
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
                Row(
                  children: [
                    Text(
                      WelcomeStrings.gender,
                      style: const TextStyle(fontSize: 20),
                    ),
                    const SizedBox(width: 40),
                    Expanded(
                      child: DropdownButton(
                        isExpanded: true,
                        hint: const Text('Select'),
                        value: gender.value,
                        items: const [
                          DropdownMenuItem(value: 'male', child: Text('Male')),
                          DropdownMenuItem(
                            value: 'female',
                            child: Text('Female'),
                          ),
                          DropdownMenuItem(
                            value: 'other',
                            child: Text('Other'),
                          ),
                        ],
                        onChanged: (value) {
                          gender.value = value;
                          if (value != null) {
                            checkDisabled();
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
