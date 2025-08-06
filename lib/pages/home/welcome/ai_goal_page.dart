import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:procal/constants/strings.dart';
import 'package:procal/pages/home/welcome/welcome_page_state.dart';
import 'package:procal/pages/home/welcome/welcome_wrapper.dart';

enum ActivityLevel {
  sedentary,
  lightlyActive,
  moderatelyActive,
  veryActive;

  String get name {
    switch (this) {
      case ActivityLevel.sedentary:
        return 'Sedentary';
      case ActivityLevel.lightlyActive:
        return 'Lightly Active';
      case ActivityLevel.moderatelyActive:
        return 'Moderately Active';
      case ActivityLevel.veryActive:
        return 'Very Active';
    }
  }
}

class AiGoalPage extends HookConsumerWidget {
  const AiGoalPage({required this.pageController, super.key});
  final PageController pageController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageState = ref.watch(welcomePageStateProvider);

    final firstController = useScrollController();
    final secondController = useScrollController();

    return pageState.when(
      data: (data) {
        final proteinController = useTextEditingController(
          text: data.generatedGoals?.protein.toString(),
        );
        final calorieController = useTextEditingController(
          text: data.generatedGoals?.caloriesSedentary.toString(),
        );
        final calorieSelection = useState<int?>(null);
        final map = <ActivityLevel, int>{};

        map[ActivityLevel.sedentary] =
            data.generatedGoals?.caloriesSedentary ?? 0;
        map[ActivityLevel.lightlyActive] =
            data.generatedGoals?.caloriesLightlyActive ?? 0;
        map[ActivityLevel.moderatelyActive] =
            data.generatedGoals?.caloriesModeratelyActive ?? 0;
        map[ActivityLevel.veryActive] =
            data.generatedGoals?.caloriesVeryActive ?? 0;
        return WelcomeWrapper(
          pageController: pageController,
          isNextDisabled: false,
          onNextPressed: () {
            // TODO: go to dashboard, maybe show animation
            // and update state/send to api
          },
          child: Column(
            spacing: 10,
            children: [
              Text(WelcomeStrings.goalsGenerated),
              Row(
                children: [
                  Text(WelcomeStrings.proteinGoal),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: proteinController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  WelcomeStrings.proteinReasoning,
                  style: const TextStyle(fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(
                height: 125,
                child: Scrollbar(
                  controller: firstController,
                  thickness: 10,
                  radius: const Radius.circular(5),
                  interactive: true,
                  trackVisibility: true,
                  thumbVisibility: true,
                  child: SingleChildScrollView(
                    controller: firstController,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: Text(
                        data.generatedGoals!.proteinReasoning,
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ),
                ),
              ),
              Divider(),
              Row(
                children: [
                  Text(WelcomeStrings.calorieGoal),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: calorieController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              DropdownButton<int>(
                items:
                    [
                          data.generatedGoals!.caloriesSedentary,
                          data.generatedGoals!.caloriesLightlyActive,
                          data.generatedGoals!.caloriesModeratelyActive,
                          data.generatedGoals!.caloriesVeryActive,
                        ]
                        .map(
                          (value) => DropdownMenuItem<int>(
                            value: value,
                            child: Text(
                              '${map.entries.firstWhere((element) => element.value == value).key.name}: ${value.toString()}',
                            ),
                          ),
                        )
                        .toList(),
                value: calorieSelection.value,
                hint: const Text('Select Activity Level'),
                onChanged: (value) {
                  if (value != null) {
                    calorieSelection.value = value;
                    calorieController.text = value.toString();
                  }
                },
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  WelcomeStrings.calorieReasoning,
                  style: const TextStyle(fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(
                height: 125,
                child: Scrollbar(
                  controller: secondController,
                  thickness: 10,
                  radius: const Radius.circular(5),
                  interactive: true,
                  trackVisibility: true,
                  thumbVisibility: true,
                  child: SingleChildScrollView(
                    controller: secondController,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: Text(
                        data.generatedGoals!.caloriesReasoning,
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(child: Text('Error: $error')),
    );
  }
}
