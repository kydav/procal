import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:procal/common/circular_progress.dart';
import 'package:procal/common/common_dialog.dart';
import 'package:procal/constants/asset_icons.dart';
import 'package:procal/pages/home/home_model.dart';
import 'package:procal/pages/home/home_widgets/add_protein_dialog.dart';
import 'package:procal/top_level_providers.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  Future<void> _showProteinDialog(
    BuildContext context,
  ) async =>
      WidgetsBinding.instance.addPostFrameCallback((_) => showAdaptiveDialog(
          context: context, builder: (context) => const CommonDialog()));

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final proteinConsumed = ref.watch(proteinConsumedProvider);
    final proteinGoal = ref.watch(proteinGoalProvider);
    final homeModel = ref.watch(homeModelProvider);
    final homeModelNotifier = ref.read(homeModelProvider.notifier);
    final caloriesConsumed = ref.watch(caloriesConsumedProvider);
    final caloriesGoal = ref.watch(caloriesGoalProvider);

    useOnAppLifecycleStateChange((_, state) {
      if (state == AppLifecycleState.resumed) {
        homeModelNotifier.init();
      }
    });
    useEffect(() {
      print(caloriesGoal);
      print(caloriesConsumed);
      return null;
    }, []);

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
                _showProteinDialog(context);
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
