import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:procal/constants/strings.dart';
import 'package:procal/pages/home/welcome/welcome_controller.dart';
import 'package:procal/pages/home/welcome/welcome_wrapper.dart';

enum GoalSettingMode { ai, manual }

class GoalSettingModePage extends HookConsumerWidget {
  const GoalSettingModePage({required this.pageController, super.key});
  final PageController pageController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final welcomeState = ref.watch(welcomeControllerProvider);
    final goalSettingMode = useState<GoalSettingMode?>(
      welcomeState.goalSettingMode ?? GoalSettingMode.ai,
    );

    return WelcomeWrapper(
      pageController: pageController,
      isNextDisabled: false,
      onNextPressed: () {
        ref
            .read(welcomeControllerProvider.notifier)
            .setGoalSettingMode(goalSettingMode.value ?? GoalSettingMode.ai);
        ref.read(welcomeControllerProvider.notifier).getGoals();
        pageController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      },
      child: Column(
        children: [
          Text(WelcomeStrings.letsSetYourGoals),
          const SizedBox(height: 20),
          Text(WelcomeStrings.aiOrManual),
          const SizedBox(height: 20),
          ListTile(
            title: Text(WelcomeStrings.aiGoalSetting),
            trailing: Radio<GoalSettingMode>(
              value: GoalSettingMode.ai,
              groupValue: goalSettingMode.value,
              onChanged: (value) {
                goalSettingMode.value = value;
              },
            ),
          ),
          ListTile(
            title: Text(WelcomeStrings.manualGoalSetting),
            trailing: Radio(
              value: GoalSettingMode.manual,
              groupValue: goalSettingMode.value,
              onChanged: (value) {
                goalSettingMode.value = value;
              },
            ),
          ),
        ],
      ),
    );
  }
}
