import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:procal/common/app_bar.dart';
import 'package:procal/common/circular_progress.dart';
import 'package:procal/constants/strings.dart';
import 'package:procal/procal_router.dart';
import 'package:procal/providers/auth_state_notifier.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
        padding: const EdgeInsets.only(top: 50.0, bottom: 30.0),
        child: Column(
          spacing: 30,
          children: [
            // Text(
            //   DateFormat.MMMMEEEEd().format(date),
            //   style: const TextStyle(fontSize: 22),
            // ),
            TextButton(
              onPressed: () {},
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Today', style: TextStyle(fontSize: 22)),
                  Icon(Icons.keyboard_arrow_down, size: 22),
                ],
              ),
            ),

            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                thumbShape: SliderComponentShape.noThumb,
                trackHeight: 10,
              ),
              child: Slider(value: .8, onChanged: (value) {}),
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
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () {
                    //show an anchor menu with options
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => SizedBox(
                        height: 300,
                        child: Column(
                          children: [
                            ListTile(
                              title: const Text('Breakfast'),
                              onTap: () {
                                // Handle option 1
                                Navigator.pop(context);
                              },
                            ),
                            ListTile(
                              title: const Text('Lunch'),
                              onTap: () {
                                // Handle option 2
                                Navigator.pop(context);
                              },
                            ),
                            ListTile(
                              title: const Text('Dinner'),
                              onTap: () {
                                // Handle option 2
                                Navigator.pop(context);
                              },
                            ),
                            ListTile(
                              title: const Text('Snack'),
                              onTap: () {
                                // Handle option 2
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  child: const Text('Track', style: TextStyle(fontSize: 18)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
