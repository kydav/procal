import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:procal/common/app_bar.dart';
import 'package:procal/common/protein_efficiency.dart';
import 'package:procal/constants/asset_icons.dart';
import 'package:procal/pages/food_search/food_detail/food_detail_page.dart';
import 'package:procal/pages/food_search/food_search_controller.dart';
import 'package:procal/procal_router.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

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
      if (maxScroll == currentScroll) {
        foodSearchController.getNextPage();
      }
    });

    return Scaffold(
      appBar: ProcalAppBar(
        showLogo: false,
        showBackButton: true,
        content: Padding(
          padding: const EdgeInsets.only(top: 3.0),
          child: TextField(
            controller: searchController,
            onSubmitted: foodSearchController.init,
            decoration: InputDecoration(
              labelText: 'Search for food',
              contentPadding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 12,
              ),
              prefixIcon: const Icon(Icons.search),
              border: const OutlineInputBorder(),
              suffixIcon: IconButton(
                icon: SvgPicture.asset(
                  AssetIcons.barcodeIcon,
                  width: 30,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).colorScheme.onSurface,
                    BlendMode.srcIn,
                  ),
                ),
                onPressed: () async {
                  var res = '';
                  if (kDebugMode) {
                    res = '0041570054161';
                  } else {
                    res =
                        await SimpleBarcodeScanner.scanBarcode(
                          context,
                          barcodeAppBar: const BarcodeAppBar(
                            appBarTitle: 'Test',
                            centerTitle: false,
                            enableBackButton: true,
                            backButtonIcon: Icon(Icons.arrow_back_ios),
                          ),
                          isShowFlashIcon: true,
                          delayMillis: 2000,
                          cameraFace: CameraFace.front,
                        ) ??
                        '';
                  }

                  if (res.isNotEmpty) {
                    if (!context.mounted) return;
                    await showModalBottomSheet(
                      context: context,
                      clipBehavior: Clip.antiAlias,
                      showDragHandle: true,
                      elevation: 5,
                      isScrollControlled: true,
                      builder: (context) => SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.8,
                        child: SingleChildScrollView(
                          child: FoodDetailPage(foodId: res, isBarcode: true),
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
          ),
        ),
        onBackPressed: () => ref.read(procalRouterProvider).pop(),
      ),
      //floatingActionButton: const ExpandableFab(),
      body: SafeArea(
        child: Column(
          children: [
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
                      return Card(
                        child: ListTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  food.foodName,
                                  maxLines: 2,
                                  softWrap: true,
                                  overflow: TextOverflow.fade,
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                              ),
                            ],
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 5,
                            children: [
                              ProteinEfficiency(
                                protein:
                                    double.tryParse(
                                      food.serving.serving.first.protein ?? '0',
                                    ) ??
                                    0,
                                calories:
                                    double.tryParse(
                                      food.serving.serving.first.calories ??
                                          '0',
                                    ) ??
                                    0,
                                height: 5,
                              ),

                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Protein: ${food.serving.serving.first.protein ?? ''} g',
                                  ),
                                  Text(
                                    'Calories: ${food.serving.serving.first.calories ?? ''} kcal',
                                  ),
                                  Text(
                                    'Fat: ${food.serving.serving.first.fat ?? ''} g',
                                  ),
                                ],
                              ),
                              Text(
                                'Serving size: ${food.serving.serving.first.servingDescription}',
                              ),
                              if (food.brandName != null &&
                                  food.brandName!.isNotEmpty) ...[
                                Text(food.brandName!),
                              ],
                            ],
                          ),

                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              clipBehavior: Clip.antiAlias,
                              showDragHandle: true,
                              elevation: 5,
                              isScrollControlled: true,
                              builder: (context) => SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height * 0.8,
                                child: SingleChildScrollView(
                                  child: FoodDetailPage(foodId: food.foodId),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),
              orElse: () => const SizedBox.shrink(),
            ),
            SizedBox(
              height: 50,
              child: Visibility(
                visible: foodSearchState.isLoading,
                child: LoadingAnimationWidget.horizontalRotatingDots(
                  color: Theme.of(context).colorScheme.primary,
                  size: 50,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
