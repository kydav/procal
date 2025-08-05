import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:procal/constants/strings.dart';
import 'package:procal/pages/home/welcome/welcome_controller.dart';
import 'package:procal/pages/home/welcome/welcome_wrapper.dart';

class ObjectivePage extends HookConsumerWidget {
  const ObjectivePage({required this.pageController, super.key});
  final PageController pageController;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final welcomeState = ref.watch(welcomeControllerProvider);

    final primaryGoal = useState<String?>(welcomeState.primaryGoal);
    final nextDisabled = useState(true);
    primaryGoal.addListener(() {
      if (primaryGoal.value != null) {
        nextDisabled.value = false;
      } else {
        nextDisabled.value = true;
      }
    });
    useEffect(() {
      if (primaryGoal.value != null) {
        nextDisabled.value = false;
      } else {
        nextDisabled.value = true;
      }
      return null;
    }, []);
    return WelcomeWrapper(
      pageController: pageController,
      isNextDisabled: nextDisabled.value,
      onNextPressed: () async {
        ref
            .read(welcomeControllerProvider.notifier)
            .setPrimaryGoal(primaryGoal.value!);
        await pageController.nextPage(
          duration: Durations.medium1,
          curve: Curves.bounceIn,
        );
      },
      child: Column(
        children: [
          Text(WelcomeStrings.primaryGoal),
          ListTile(
            title: Text(WelcomeStrings.loseWeight),
            trailing: Radio(
              value: 'lose_weight',
              groupValue: primaryGoal.value,
              onChanged: (value) {
                primaryGoal.value = value;
              },
            ),
          ),
          ListTile(
            title: Text(WelcomeStrings.buildMuscle),
            trailing: Radio(
              value: 'build_muscle',
              groupValue: primaryGoal.value,
              onChanged: (value) {
                primaryGoal.value = value;
              },
            ),
          ),
          ListTile(
            title: Text(WelcomeStrings.maintainWeight),
            trailing: Radio(
              value: 'maintain_weight',
              groupValue: primaryGoal.value,
              onChanged: (value) {
                primaryGoal.value = value;
              },
            ),
          ),
        ],
      ),
    );
  }
}
