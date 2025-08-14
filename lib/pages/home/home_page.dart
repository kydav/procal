import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:procal/common/circular_progress.dart';
import 'package:procal/constants/asset_icons.dart';
import 'package:procal/constants/strings.dart';
import 'package:procal/procal_router.dart';
import 'package:procal/services/device_services/auth_service.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  // Future<void> _showDialog(
  //   BuildContext context,
  //   bool showProtein,
  //   bool showCalories,
  //   TextEditingController proteinController,
  //   TextEditingController caloriesController,
  //   StateController<int?> proteinGoal,
  //   StateController<int?> caloriesGoal,
  // ) async => WidgetsBinding.instance.addPostFrameCallback(
  //   (_) => showAdaptiveDialog(
  //     context: context,
  //     builder: (context) => CommonDialog(
  //       title: showProtein && showCalories
  //           ? DialogStrings.enterGoals
  //           : DialogStrings.enterGoal,
  //       content: Column(
  //         children: [
  //           if (showProtein)
  //             FormFieldTitle(
  //               title: DialogStrings.proteinGoal,
  //               child: TextField(
  //                 textAlign: TextAlign.center,
  //                 keyboardType: TextInputType.number,
  //                 controller: proteinController,
  //               ),
  //             ),
  //           if (showCalories)
  //             FormFieldTitle(
  //               title: DialogStrings.caloriesGoal,
  //               child: TextField(
  //                 textAlign: TextAlign.center,
  //                 keyboardType: TextInputType.number,
  //                 controller: caloriesController,
  //               ),
  //             ),
  //         ],
  //       ),
  //       onSubmit: () async {
  //         if (showProtein) {
  //           final intValue = int.tryParse(proteinController.value.text);
  //           if (intValue != null) {
  //             final prefs = await SharedPreferences.getInstance();
  //             await prefs.setInt(SystemStrings.proteinGoal, intValue);
  //             proteinGoal.update((_) => intValue);
  //           }
  //         }
  //         if (showCalories) {
  //           final intValue = int.tryParse(caloriesController.value.text);
  //           if (intValue != null) {
  //             final prefs = await SharedPreferences.getInstance();
  //             await prefs.setInt(SystemStrings.caloriesGoal, intValue);
  //             caloriesGoal.update((_) => intValue);
  //           }
  //         }
  //         Navigator.pop(context);
  //       },
  //     ),
  //   ),
  // );

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
    // final proteinConsumed = ref.watch(proteinConsumedProvider);
    // final caloriesConsumed = ref.watch(caloriesConsumedProvider);

    //final homeModel = ref.watch(homeModelProvider);
    //final homeModelNotifier = ref.read(homeModelProvider.notifier);

    //final proteinController = useTextEditingController();
    // final proteinGoal = ref.watch(proteinGoalProvider);
    // final proteinGoalNotifier = ref.watch(proteinGoalProvider.notifier);

    //final caloriesController = useTextEditingController();
    // final caloriesGoal = ref.watch(caloriesGoalProvider);
    // final caloriesGoalNotifier = ref.watch(caloriesGoalProvider.notifier);

    // useOnAppLifecycleStateChange((_, state) {
    //   if (state == AppLifecycleState.resumed) {
    //     homeModelNotifier.init();
    //   }
    // });

    // useEffect(() {
    //   // addPostFrameCallback is used to ensure that the widget is fully built before showing the dialog
    //   WidgetsBinding.instance.addPostFrameCallback((_) async {
    //     //showBottom sheet
    //     Scaffold.of(context).showBottomSheet(
    //       (context) => Column(
    //         children: [
    //           Text(WelcomeStrings.forTheBestExperience),
    //           const SizedBox(height: 20),
    //           OutlinedButton(
    //             onPressed: () async {
    //               final hasAccess = await ref
    //                   .read(healthServiceProvider.notifier)
    //                   .requestDataAccess();
    //               if (hasAccess && context.mounted) {
    //                 toastification.show(
    //                   context: context,
    //                   title: Text(ToastStrings.healthGranted),
    //                   type: ToastificationType.success,
    //                   style: ToastificationStyle.fillColored,
    //                   alignment: Alignment.bottomCenter,
    //                   autoCloseDuration: const Duration(seconds: 3),
    //                   showProgressBar: false,
    //                 );
    //                 ref.read(procalRouterProvider).pop();
    //               } else if (context.mounted) {
    //                 // toastification.show(
    //                 //   context: context,
    //                 //   title: Text(ToastStrings.healthDenied),
    //                 //   type: ToastificationType.error,
    //                 //   style: ToastificationStyle.fillColored,
    //                 //   alignment: Alignment.bottomCenter,
    //                 //   autoCloseDuration: const Duration(seconds: 3),
    //                 //   showProgressBar: false,
    //                 // );
    //               }
    //             },
    //             child: Text(WelcomeStrings.enableHealthPermissions),
    //           ),
    //         ],
    //       ),
    //     );
    //   });
    // }, []);
    //final date = DateTime.now();
    debugPrint('HomePage built');

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
      body:
          // switch (homeModel) {
          //   HomeLoading() => const CircularProgressIndicator(),
          //   HomeInitial() => Builder(
          //     builder: (context) {
          //       if (proteinGoal == null || caloriesGoal == null) {
          //         // _showDialog(
          //         //   context,
          //         //   proteinGoal == null,
          //         //   caloriesGoal == null,
          //         //   proteinController,
          //         //   caloriesController,
          //         //   storageService,
          //         //   proteinGoalNotifier,
          //         //   caloriesGoalNotifier,
          //         // );
          //       }
          Align(
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
                          current: 0,
                          total: 0,
                        ),
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [Text('Sunday'), Text('December 20, 2024')],
                        ),
                      ],
                    ),
                    CircularProgress(
                      title: GeneralStrings.calories,
                      sizeFactor: 50,
                      current: 0,
                      total: 0,
                    ),
                  ],
                ),
              ),
            ),
          ), //;
      //    },
      //    ),
      //  },
    );
  }
}
