import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:procal/pages/food_search/food_search_controller.dart';

class FoodSearchPage extends HookConsumerWidget {
  const FoodSearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchController = useTextEditingController();
    final foodSearchController = ref.watch(
      foodSearchControllerProvider.notifier,
    );
    final foodSearchState = ref.watch(foodSearchControllerProvider);

    final controller = useScrollController();

    controller.addListener(() {
      final maxScroll = controller.position.maxScrollExtent;
      final currentScroll = controller.position.pixels;
      //const delta = 360 * 0.20;
      if (maxScroll == currentScroll) {
        //print('Max Scroll: $maxScroll, Current Scroll: $currentScroll');

        foodSearchController.getNextPage();
      }
    });

    return Scaffold(
      appBar: AppBar(title: const Text('Food Search'), centerTitle: true),
      body: Column(
        children: [
          TextField(
            controller: searchController,
            onSubmitted: foodSearchController.init,

            decoration: const InputDecoration(
              labelText: 'Search for food',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(),
            ),
          ),
          foodSearchState.maybeWhen(
            data:
                (foodList) => Expanded(
                  child: ListView.builder(
                    controller: controller,
                    itemCount: foodList.length,
                    itemBuilder: (context, index) {
                      final food = foodList[index];
                      return ListTile(
                        title: Text(food.foodName),
                        subtitle: Text(food.foodType),
                      );
                    },
                  ),
                ),
            orElse: () => const SizedBox.shrink(),
          ),
          if (foodSearchState.isLoading) const CircularProgressIndicator(),
        ],
      ),
    );
  }
}
