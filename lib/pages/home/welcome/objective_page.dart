import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:procal/constants/strings.dart';
import 'package:procal/pages/home/welcome/welcome_controller.dart';

class ObjectivePage extends HookConsumerWidget {
  const ObjectivePage({required this.pageDisabled, super.key});
  final ValueNotifier<bool> pageDisabled;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final welcomeState = ref.watch(welcomeControllerProvider);

    final primaryGoal = useState<String?>(welcomeState.primaryGoal);
    primaryGoal.addListener(() {
      ref
          .read(welcomeControllerProvider.notifier)
          .setPrimaryGoal(primaryGoal.value!);
      if (primaryGoal.value != null) {
        pageDisabled.value = false;
      } else {
        pageDisabled.value = true;
      }
    });
    return Column(
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
    );
  }
}
