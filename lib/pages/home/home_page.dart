import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:procal/common/app_bar.dart';
import 'package:procal/common/circular_progress.dart';
import 'package:procal/constants/strings.dart';
import 'package:procal/procal_router.dart';
import 'package:procal/providers/auth_state_notifier.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final date = DateTime.now();
    final authState = ref.watch(authStateNotifierProvider);
    final proteinGoal = authState.asData?.value.goals?.proteinGoal ?? 0;
    final caloriesGoal = authState.asData?.value.goals?.calorieGoal ?? 0;

    return Scaffold(
      appBar: const ProcalAppBar(showMenu: true),
      floatingActionButton: IconButton(
        onPressed: () {
          ref.read(procalRouterProvider).push('/search');
        },
        icon: const Icon(Icons.add, size: 50),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: SingleChildScrollView(
          child: Column(
            spacing: 30,
            children: [
              Text(
                DateFormat.MMMMEEEEd().format(date),
                style: const TextStyle(fontSize: 22),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CircularProgress(
                    title: GeneralStrings.protein,
                    sizeFactor: 50,
                    current: 0,
                    total: proteinGoal,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: CircularProgress(
                      title: GeneralStrings.calories,
                      sizeFactor: 30,
                      current: 0,
                      total: caloriesGoal,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
