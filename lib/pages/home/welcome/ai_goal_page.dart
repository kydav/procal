import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:procal/pages/home/welcome/welcome_controller.dart';
import 'package:procal/pages/home/welcome/welcome_wrapper.dart';
import 'package:procal/services/ai_service.dart';

class AiGoalPage extends HookConsumerWidget {
  const AiGoalPage({required this.pageController, super.key});
  final PageController pageController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageState = ref.watch(welcomeControllerProvider);

    return pageState.isLoading
        ? const Center(child: CircularProgressIndicator())
        : WelcomeWrapper(
            pageController: pageController,
            isNextDisabled: false,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Text('Your AI Generated Goals:'),
                  if (pageState.generatedGoals != null)
                    Column(
                      children: [
                        Text(
                          'Protein Goal: ${pageState.generatedGoals!.protein}g',
                        ),
                        Text(
                          'Protein Reasoning: ${pageState.generatedGoals!.proteinReasoning}',
                        ),
                        Text(
                          'Calorie Goal: ${pageState.generatedGoals!.calories} calories',
                        ),
                        Text(
                          'Calorie Reasoning: ${pageState.generatedGoals!.caloriesReasoning}',
                        ),
                      ],
                    ),
                ],
              ),
            ),
          );
  }
}
