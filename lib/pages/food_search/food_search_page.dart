import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:procal/pages/food_search/food_search_controller.dart';
import 'package:procal/top_level_providers.dart';

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
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 5.0,
              ),
              child: TextField(
                controller: searchController,
                onSubmitted: foodSearchController.init,
                decoration: const InputDecoration(
                  labelText: 'Search for food',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            foodSearchState.maybeWhen(
              data: (foodList) => Expanded(
                child: RefreshIndicator(
                  onRefresh: () async =>
                      foodSearchController.refresh(searchController.text),
                  child: ListView.builder(
                    controller: controller,
                    itemCount: foodList.length,
                    itemBuilder: (context, index) {
                      final food = foodList[index];
                      return ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(food.foodName, maxLines: 2, softWrap: true),
                          ],
                        ),
                        subtitle: Column(
                          children: [
                            Text(food.serving.serving.first.servingDescription),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(food.brandName ?? ''),
                                Text(
                                  'Protein: ${food.serving.serving.first.protein ?? ''}g',
                                ),
                                Text(
                                  'Calories: ${food.serving.serving.first.calories ?? ''}',
                                ),
                              ],
                            ),
                          ],
                        ),

                        onTap: () {
                          ref
                              .read(procalRouterProvider)
                              .push('/food_detail/${food.foodId}');
                        },
                      );
                    },
                  ),
                ),
              ),
              orElse: () => const SizedBox.shrink(),
            ),
            if (foodSearchState.isLoading)
              LoadingAnimationWidget.horizontalRotatingDots(
                color: Theme.of(context).colorScheme.primary,
                size: 50,
              ),
          ],
        ),
      ),
    );
  }
}
