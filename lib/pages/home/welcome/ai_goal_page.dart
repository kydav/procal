import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:procal/pages/home/welcome/welcome_page_state.dart';
import 'package:procal/pages/home/welcome/welcome_wrapper.dart';
import 'package:procal/services/ai_service.dart';

class AiGoalPage extends HookConsumerWidget {
  const AiGoalPage({required this.pageController, super.key});
  final PageController pageController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageState = ref.watch(welcomePageStateProvider);

    return pageState.when(
      data: (data) {
        if (data.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        return WelcomeWrapper(
          pageController: pageController,
          isNextDisabled: false,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text('Your AI Generated Goals:'),
                if (data.generatedGoals != null)
                  Column(
                    children: [
                      Text('Protein Goal: ${data.generatedGoals!.protein}g'),
                      Text(
                        'Protein Reasoning: ${data.generatedGoals!.proteinReasoning}',
                      ),
                      Text(
                        'Sedentary Calorie Goal: ${data.generatedGoals!.caloriesSedentary} calories',
                      ),
                      Text(
                        'Lightly Active Calorie Goal: ${data.generatedGoals!.caloriesLightlyActive} calories',
                      ),
                      Text(
                        'Moderately Active Calorie Goal: ${data.generatedGoals!.caloriesModeratelyActive} calories',
                      ),
                      Text(
                        'Very Active Calorie Goal: ${data.generatedGoals!.caloriesVeryActive} calories',
                      ),
                      Text(
                        'Calorie Reasoning: ${data.generatedGoals!.caloriesReasoning}',
                      ),
                    ],
                  ),
              ],
            ),
          ),
        );
        ;
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(child: Text('Error: $error')),
    );
  }
}
