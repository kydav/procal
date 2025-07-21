import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:procal/pages/food_search/food_detail/food_detail_controller.dart';
import 'package:procal/top_level_providers.dart';

class FoodDetailPage extends HookConsumerWidget {
  const FoodDetailPage({required this.foodId, super.key});
  final String foodId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(foodDetailControllerProvider(foodId));
    return state.when(
      data: (food) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => ref.read(procalRouterProvider).pop(),
            icon: const Icon(Icons.chevron_left),
          ),
          title: const Text('Add Food'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8,
            children: [
              Text(food.food.foodName),

              if (food.food.foodType == 'Brand')
                Text(food.food.brandName ?? ''),
              const Text('Servings:'),
              ...food.food.serving.serving.map(
                (serving) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Name: ${serving.servingDescription}'),
                    Text(
                      'Amount: ${serving.metricServingAmount} ${serving.metricServingUnit}',
                    ),
                    Text('Calories: ${serving.calories}'),
                    Text('Protein: ${serving.protein}g'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => Center(child: Text('Error: $error')),
    );
  }
}
