import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:procal/common/circular_progress.dart';
import 'package:procal/common/common_dialog.dart';
import 'package:procal/pages/home/home_model.dart';
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
    final protein = useState(0);
    final healthService = ref.read(healthServiceProvider);
    final proteinConsumed = ref.watch(proteinConsumedProvider);
    final proteinGoal = ref.watch(proteinGoalProvider);
    final homeModel = ref.watch(homeModelProvider);
    useEffect(() {
      //if (proteinGoal != null) {
      _showProteinDialog(context);
      //}

      return null;
    }, []);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Procal'),
        ),
        body: homeModel.when(
          loading: () => const CircularProgressIndicator(),
          initial: () => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircularProgress(
                    current: proteinConsumed ?? 0, total: proteinGoal ?? 0),
                TextField(
                  onChanged: (value) {
                    if (int.tryParse(value) != null) {
                      protein.value = int.parse(value);
                    }
                  },
                ),
                TextButton(
                    onPressed: () {
                      healthService.submitProtein(protein.value);
                    },
                    child: const Text('Submit')),
              ],
            ),
          ),
        ));
  }
}
