import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:procal/constants/strings.dart';
import 'package:procal/pages/home/welcome/welcome_page_state.dart';
import 'package:procal/pages/home/welcome/welcome_wrapper.dart';

class ObjectivePage extends HookConsumerWidget {
  const ObjectivePage({required this.pageController, super.key});
  final PageController pageController;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final welcomeState = ref.watch(welcomePageStateProvider);

    final primaryGoal = useState<String?>(welcomeState.value?.primaryGoal);
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
            .read(welcomePageStateProvider.notifier)
            .setPrimaryGoal(primaryGoal.value!);
        await pageController.nextPage(
          duration: Durations.medium1,
          curve: Curves.bounceIn,
        );
      },
      child: RadioGroup<String>(
        onChanged: (value) => primaryGoal.value = value,
        groupValue: primaryGoal.value,
        child: Column(
          children: [
            Text(WelcomeStrings.primaryGoal),
            ListTile(
              title: Text(WelcomeStrings.loseWeight),
              onTap: () => primaryGoal.value = 'lose_weight',
              trailing: const Radio(value: 'lose_weight'),
            ),
            ListTile(
              title: Text(WelcomeStrings.buildMuscle),
              onTap: () => primaryGoal.value = 'build_muscle',
              trailing: const Radio(value: 'build_muscle'),
            ),
            ListTile(
              title: Text(WelcomeStrings.maintainWeight),
              onTap: () => primaryGoal.value = 'maintain_weight',
              trailing: const Radio(value: 'maintain_weight'),
            ),
          ],
        ),
      ),
    );
  }
}
