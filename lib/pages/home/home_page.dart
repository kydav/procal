import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:procal/common/circular_progress.dart';
import 'package:procal/common/common_dialog.dart';
import 'package:procal/common/form_field_title.dart';
import 'package:procal/constants/asset_icons.dart';
import 'package:procal/constants/strings.dart';
import 'package:procal/constants/system_strings.dart';
import 'package:procal/pages/home/home_model.dart';
import 'package:procal/pages/home/home_state.dart';
import 'package:procal/procal_router.dart';
import 'package:procal/services/device_services/auth_service.dart';
import 'package:procal/top_level_providers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  Future<void> _showDialog(
    BuildContext context,
    bool showProtein,
    bool showCalories,
    TextEditingController proteinController,
    TextEditingController caloriesController,
    StateController<int?> proteinGoal,
    StateController<int?> caloriesGoal,
  ) async => WidgetsBinding.instance.addPostFrameCallback(
    (_) => showAdaptiveDialog(
      context: context,
      builder: (context) => CommonDialog(
        title: showProtein && showCalories
            ? DialogStrings.enterGoals
            : DialogStrings.enterGoal,
        content: Column(
          children: [
            if (showProtein)
              FormFieldTitle(
                title: DialogStrings.proteinGoal,
                child: TextField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  controller: proteinController,
                ),
              ),
            if (showCalories)
              FormFieldTitle(
                title: DialogStrings.caloriesGoal,
                child: TextField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  controller: caloriesController,
                ),
              ),
          ],
        ),
        onSubmit: () async {
          if (showProtein) {
            final intValue = int.tryParse(proteinController.value.text);
            if (intValue != null) {
              final prefs = await SharedPreferences.getInstance();
              await prefs.setInt(SystemStrings.proteinGoal, intValue);
              proteinGoal.update((_) => intValue);
            }
          }
          if (showCalories) {
            final intValue = int.tryParse(caloriesController.value.text);
            if (intValue != null) {
              final prefs = await SharedPreferences.getInstance();
              await prefs.setInt(SystemStrings.caloriesGoal, intValue);
              caloriesGoal.update((_) => intValue);
            }
          }
          Navigator.pop(context);
        },
      ),
    ),
  );

  // Future<void> testThing(AiService aiService) async {
  //   final response = await aiService.generateResponseToMeal(
  //     mealProtein: 30,
  //     mealCalories: 300,
  //     goalProtein: 200,
  //     goalCalories: 2400,
  //   );
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final proteinConsumed = ref.watch(proteinConsumedProvider);
    final caloriesConsumed = ref.watch(caloriesConsumedProvider);

    final homeModel = ref.watch(homeModelProvider);
    final homeModelNotifier = ref.read(homeModelProvider.notifier);

    final proteinController = useTextEditingController();
    final proteinGoal = ref.watch(proteinGoalProvider);
    final proteinGoalNotifier = ref.watch(proteinGoalProvider.notifier);

    final caloriesController = useTextEditingController();
    final caloriesGoal = ref.watch(caloriesGoalProvider);
    final caloriesGoalNotifier = ref.watch(caloriesGoalProvider.notifier);

    useOnAppLifecycleStateChange((_, state) {
      if (state == AppLifecycleState.resumed) {
        homeModelNotifier.init();
      }
    });
    //final date = DateTime.now();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: Image.asset(AssetIcons.horizontalTransparentLogo, height: 45),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu, size: 30),
            onPressed: () {
              ref.read(authServiceProvider.notifier).logoutUser();
              // Navigate to settings page
            },
          ),
        ],
      ),
      floatingActionButton: IconButton(
        onPressed: () {
          ref.read(procalRouterProvider).go('/search');
          // showAdaptiveDialog(
          //   context: context,
          //   builder: (context) => const AddProteinDialog(),
          // );
        },
        icon: const Icon(Icons.add, size: 50),
      ),
      body: switch (homeModel) {
        HomeLoading() => const CircularProgressIndicator(),
        HomeInitial() => Builder(
          builder: (context) {
            if (proteinGoal == null || caloriesGoal == null) {
              // _showDialog(
              //   context,
              //   proteinGoal == null,
              //   caloriesGoal == null,
              //   proteinController,
              //   caloriesController,
              //   storageService,
              //   proteinGoalNotifier,
              //   caloriesGoalNotifier,
              // );
            }
            return Align(
              child: Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: SingleChildScrollView(
                  child: Column(
                    spacing: 30,
                    children: <Widget>[
                      Row(
                        children: [
                          CircularProgress(
                            title: GeneralStrings.protein,
                            sizeFactor: 30,
                            current: proteinConsumed ?? 0,
                            total: proteinGoal ?? 0,
                          ),
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text('Sunday'),
                              Text('December 20, 2024'),
                            ],
                          ),
                        ],
                      ),
                      CircularProgress(
                        title: GeneralStrings.calories,
                        sizeFactor: 50,
                        current: caloriesConsumed ?? 0,
                        total: caloriesGoal ?? 0,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      },
    );
  }
}
