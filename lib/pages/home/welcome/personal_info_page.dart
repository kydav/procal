import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:procal/constants/strings.dart';
import 'package:procal/pages/home/welcome/welcome_controller.dart';
import 'package:procal/pages/home/welcome/welcome_wrapper.dart';

class PersonalInfoPage extends HookConsumerWidget {
  const PersonalInfoPage({required this.pageController, super.key});
  final PageController pageController;

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
    final nextDisabled = useState(true);

    void checkDisabled() {
      welcomeController
        ..setFirstName(firstNameController.value.text)
        ..setLastName(lastNameController.value.text)
        ..setAge(ageController.value.text);
      if (firstNameController.value.text.isEmpty ||
          ageController.value.text.isEmpty) {
        nextDisabled.value = true;
      } else {
        nextDisabled.value = false;
      }
    }

    useEffect(() {
      if (firstNameController.text.isNotEmpty &&
          ageController.text.isNotEmpty) {
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
              ],
            ),
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     //if (index.value > 0)
          //       CircleAvatar(
          //         child: IconButton(
          //           onPressed: () async => carouselController.previousPage(
          //             duration: Durations.medium1,
          //             curve: Curves.bounceIn,
          //           ),
          //           icon: const Icon(Icons.arrow_back),
          //         ),
          //       ),
          //     //if (index.value == 0) const SizedBox(),
          //     CircleAvatar(
          //       child: IconButton(
          //         onPressed: isNextDisabled.value
          //             ? null
          //             : () async {
          //                 await carouselController.nextPage(
          //                   duration: Durations.medium1,
          //                   curve: Curves.bounceIn,
          //                 );
          //                 FocusScope.of(context).unfocus();
          //               },
          //         icon: const Icon(Icons.arrow_forward),
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
