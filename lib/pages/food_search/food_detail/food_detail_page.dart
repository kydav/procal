import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:procal/common/protein_efficiency.dart';
import 'package:procal/pages/food_search/food_detail/food_detail_controller.dart';
import 'package:procal/pages/food_search/food_search_state_controller.dart';
import 'package:procal/services/api/models/food/serving.dart';
import 'package:procal/services/api/models/meal/meal_food.dart';

class FoodDetailPage extends HookConsumerWidget {
  const FoodDetailPage({
    required this.foodId,
    this.isBarcode = false,
    super.key,
  });
  final String foodId;
  final bool isBarcode;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isValid = useState(true);
    return ref
        .watch(
          foodDetailControllerProvider(foodId: foodId, isBarcode: isBarcode),
        )
        .when(
          data: (food) {
            final selectedServing = useState(food.food.serving.serving.first);

            final amountController = useTextEditingController(text: '1');
            final calories =
                double.tryParse(
                  food.food.serving.serving.first.calories ?? '0',
                ) ??
                0;

            final protein =
                double.tryParse(
                  food.food.serving.serving.first.protein ?? '0',
                ) ??
                0;
            final totalProtein = useState(0.0);
            final totalCalories = useState(0.0);
            final totalFat = useState(0.0);
            void setValues() {
              totalProtein.value =
                  (double.tryParse(selectedServing.value.protein ?? '0') ?? 0) *
                  (double.tryParse(amountController.text) ?? 1);
              totalCalories.value =
                  (double.tryParse(selectedServing.value.calories ?? '0') ??
                      0) *
                  (double.tryParse(amountController.text) ?? 1);
              totalFat.value =
                  (double.tryParse(selectedServing.value.fat ?? '0') ?? 0) *
                  (double.tryParse(amountController.text) ?? 1);
            }

            selectedServing.addListener(setValues);
            amountController.addListener(setValues);
            useEffect(() {
              setValues();
              return null;
            }, []);

            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 40.0,
                  bottom: 60.0,
                  right: 40.0,
                ),
                child: Column(
                  spacing: 15,
                  children: [
                    Text(
                      food.food.foodName,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    ProteinEfficiency(protein: protein, calories: calories),
                    if (food.food.foodType == 'Brand')
                      Text(food.food.brandName ?? ''),
                    TextFormField(
                      controller: amountController,
                      inputFormatters: [DecimalTextInputFormatter()],
                      onChanged: (value) => isValid.value =
                          value.isNotEmpty && double.tryParse(value) != null,
                      decoration: const InputDecoration(
                        labelText: 'Amount',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    DropdownMenu<Serving?>(
                      width: double.infinity,
                      initialSelection: selectedServing.value,
                      onSelected: (value) => selectedServing.value = value!,
                      label: const Text('Serving Size'),
                      dropdownMenuEntries: food.food.serving.serving
                          .map(
                            (serving) => DropdownMenuEntry<Serving?>(
                              value: serving,
                              label: serving.servingDescription,
                            ),
                          )
                          .toList(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            const Text('Protein'),
                            Text(
                              '${totalProtein.value.toStringAsFixed(2)} g',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            const Text('Calories'),
                            Text(
                              '${totalCalories.value.toStringAsFixed(2)} kcal',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            const Text('Fat'),
                            Text(
                              '${totalFat.value.toStringAsFixed(2)} g',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ],
                        ),
                      ],
                    ),

                    const Spacer(),
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                        onPressed: isValid.value
                            ? () {
                                final mealFood = MealFood(
                                  foodId: food.food.foodId,
                                  foodName: food.food.foodName,
                                  foodAmount: amountController.text,
                                  protein: totalProtein.value,
                                  calories: totalCalories.value,
                                  fat: totalFat.value,
                                );

                                ref
                                    .read(
                                      foodSearchStateControllerProvider
                                          .notifier,
                                    )
                                    .addFood(mealFood);
                              }
                            : null,
                        child: const Text(
                          'Add to Meal',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) => Center(child: Text('Error: $error')),
        );
  }
}

class DecimalTextInputFormatter extends TextInputFormatter {
  DecimalTextInputFormatter({this.decimalRange = 2});
  final int decimalRange;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text;

    // Allow empty string
    if (text.isEmpty) return newValue;

    // Only allow one decimal point
    if (text.indexOf('.') != text.lastIndexOf('.')) return oldValue;

    // Only allow up to [decimalRange] digits after decimal
    final parts = text.split('.');
    if (parts.length > 1 && parts[1].length > decimalRange) {
      return oldValue;
    }
    final decimalIndex = text.indexOf('.');
    final whole = decimalIndex >= 0 ? text.substring(0, decimalIndex) : text;
    final decimals = decimalIndex >= 0 ? text.substring(decimalIndex + 1) : '';
    // Limit digits before decimal
    if (whole.length > 2) return oldValue;

    // Limit digits after decimal
    if (decimals.length > decimalRange) return oldValue;

    // Only allow valid input: digits, optional leading decimal
    final regExp = decimalIndex >= 0
        ? RegExp(r'^\d{0,3}\.?(\d{0,2})?$')
        : RegExp(r'^\d{0,3}$');
    if (!regExp.hasMatch(text)) return oldValue;

    return newValue;
  }
}
