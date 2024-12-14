import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:procal/common/circular_progress.dart';
import 'package:procal/common/common_dialog.dart';
import 'package:procal/constants/asset_icons.dart';
import 'package:procal/constants/strings.dart';
import 'package:procal/constants/system_strings.dart';
import 'package:procal/pages/home/home_model.dart';
import 'package:procal/pages/home/home_widgets/add_protein_dialog.dart';
import 'package:procal/services/device_services/local_storage_service.dart';
import 'package:procal/top_level_providers.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  Future<void> _showProteinDialog(
          BuildContext context,
          TextEditingController proteinController,
          LocalStorageService storageService,
          StateController<int?> proteinGoal) async =>
      WidgetsBinding.instance.addPostFrameCallback((_) => showAdaptiveDialog(
          context: context,
          builder: (context) => CommonDialog(
                title: DialogStrings.proteinGoal,
                content: TextField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  controller: proteinController,
                ),
                onSubmit: () async {
                  final intValue = int.tryParse(proteinController.value.text);
                  if (intValue != null) {
                    storageService.storeInt(
                        SystemStrings.proteinGoal, intValue);
                    proteinGoal.update((_) => intValue);
                  }

                  Navigator.pop(context);
                },
              )));

  Future<void> _showCaloriesDialog(
          BuildContext context,
          TextEditingController caloriesController,
          LocalStorageService storageService,
          StateController<int?> caloriesGoal) async =>
      WidgetsBinding.instance.addPostFrameCallback((_) => showAdaptiveDialog(
          context: context,
          builder: (context) => CommonDialog(
                title: DialogStrings.caloriesGoal,
                content: TextField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  controller: caloriesController,
                ),
                onSubmit: () async {
                  final intValue = int.tryParse(caloriesController.value.text);
                  if (intValue != null) {
                    storageService.storeInt(
                        SystemStrings.caloriesGoal, intValue);
                    caloriesGoal.update((_) => intValue);
                  }

                  Navigator.pop(context);
                },
              )));

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final proteinConsumed = ref.watch(proteinConsumedProvider);
    final caloriesConsumed = ref.watch(caloriesConsumedProvider);

    final homeModel = ref.watch(homeModelProvider);
    final homeModelNotifier = ref.read(homeModelProvider.notifier);

    final storageService = ref.read(localStorageServiceProvider);

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

    return Scaffold(
        appBar: AppBar(
          elevation: 4,
          titleSpacing: -30,
          //backgroundColor: CustomColors.primaryBlue,
          title: Padding(
              padding: EdgeInsets
                  .zero, //isMobile ? EdgeInsets.zero : const EdgeInsets.only(top: 15),
              child: Image.asset(
                AssetIcons.horizontalTransparentLogo,
                height: 45,
              )),
        ),
        floatingActionButton: IconButton(
            onPressed: () {
              showAdaptiveDialog(
                  context: context,
                  builder: (context) => const AddProteinDialog());
            },
            icon: const Icon(Icons.add)),
        body: homeModel.when(
            loading: () => const CircularProgressIndicator(),
            initial: () {
              if (proteinGoal == null) {
                _showProteinDialog(context, proteinController, storageService,
                    proteinGoalNotifier);
              }
              if (caloriesGoal == null) {
                _showCaloriesDialog(context, caloriesController, storageService,
                    caloriesGoalNotifier);
              }
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CircularProgress(
                        current: proteinConsumed ?? 0, total: proteinGoal ?? 0),
                    CircularProgress(
                        current: caloriesConsumed ?? 0,
                        total: caloriesGoal ?? 0),
                  ],
                ),
              );
            }));
  }
}
