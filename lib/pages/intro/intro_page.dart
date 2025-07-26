import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:procal/constants/asset_icons.dart';
import 'package:procal/constants/strings.dart';
import 'package:procal/constants/text_styles.dart';
import 'package:procal/hooks/carousel_hook.dart';
import 'package:procal/services/device_services/health_service.dart';
import 'package:toastification/toastification.dart';

class IntroPage extends HookConsumerWidget {
  const IntroPage({super.key});

  Row _buttons(CarouselSliderController controller, {bool first = false}) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (!first)
            IconButton(
              onPressed: () {
                controller.previousPage();
              },
              icon: const Icon(Icons.arrow_back_ios),
            ),
          if (first) const SizedBox(),
          IconButton(
            onPressed: () {
              controller.nextPage();
            },
            icon: const Icon(Icons.arrow_forward_ios),
          ),
        ],
      );

  Column _wrapper(Widget content, Widget controls) => Column(
    children: [
      Expanded(child: content),
      controls,
    ],
  );

  Column _first(HealthService healthService, BuildContext context) => Column(
    children: [
      Text(IntroStrings.welcome, style: TextStyles.menuTitle),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Text(IntroStrings.healthAccess, textAlign: TextAlign.center),
      ),
      Text(IntroStrings.writeRead, textAlign: TextAlign.center),
      TextButton(
        onPressed: () async {
          final hasAccess = await healthService.requestDataAccess();
          if (hasAccess && context.mounted) {
            toastification.show(
              context: context,
              title: Text(ToastStrings.healthGranted),
              type: ToastificationType.success,
              style: ToastificationStyle.fillColored,
              alignment: Alignment.bottomCenter,
              autoCloseDuration: const Duration(seconds: 3),
              showProgressBar: false,
            );
          } else if (context.mounted) {
            toastification.show(
              context: context,
              title: Text(ToastStrings.healthDenied),
              type: ToastificationType.error,
              style: ToastificationStyle.fillColored,
              alignment: Alignment.bottomCenter,
              autoCloseDuration: const Duration(seconds: 3),
              showProgressBar: false,
            );
          }
        },
        child: Text(GeneralStrings.enableAccess),
      ),
    ],
  );

  Column _second() => const Column(
    children: [
      Text(
        'Procal is a new kind of tracker app for only calories and protein, and attempts to guide you to increasing your calories and protein initially in what is called a Reverse Diet.  ',
      ),
    ],
  );

  Column _third(
    TextEditingController proteinGoalController,
    TextEditingController goalWeightController,
  ) => Column(
    children: [
      Text(IntroStrings.proteinGoalTitle),
      Text(IntroStrings.proteinRecommend),
      Text(IntroStrings.goalWeight),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        child: TextField(
          textAlign: TextAlign.center,
          controller: goalWeightController,
        ),
      ),
      Text(IntroStrings.recommendProteinGoal),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        child: TextField(
          textAlign: TextAlign.center,
          controller: proteinGoalController,
        ),
      ),
    ],
  );

  Column _fourth(
    TextEditingController goalWeightController,
    TextEditingController calorieGoalController,
  ) => Column(
    children: [
      Text(IntroStrings.calorieGoalTitle),
      Text(IntroStrings.calorieRecommend),
      Text(IntroStrings.calorieWeight),
      Text(IntroStrings.goalWeightText),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        child: Text(goalWeightController.value.text),
      ),
      Text(IntroStrings.recommendCalorieGoal),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        child: TextField(
          textAlign: TextAlign.center,
          controller: calorieGoalController,
        ),
      ),
    ],
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final healthService = ref.read(healthServiceProvider.notifier);

    final controller = useCarouselSliderController();
    final goalWeightController = useTextEditingController();
    final proteinGoalController = useTextEditingController();
    final calorieGoalController = useTextEditingController();
    final heightController = useTextEditingController();
    final currentWeightController = useTextEditingController();
    final ageController = useTextEditingController();

    useEffect(
      () {
        if (goalWeightController.text.isNotEmpty &&
            heightController.text.isNotEmpty &&
            currentWeightController.text.isNotEmpty) {
          calorieGoalController.text =
              (10 * int.parse(goalWeightController.text) +
                      6.25 * int.parse(heightController.text) -
                      5 * int.parse(ageController.text) +
                      5)
                  .toString();
        }
        return null;
      },
      [
        goalWeightController,
        heightController,
        currentWeightController,
        ageController,
      ],
    );
    goalWeightController.addListener(
      () => proteinGoalController.value = goalWeightController.value,
    );
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        // leading: !includeBackButton
        //     ? const SizedBox.shrink()
        //     : IconButton(icon: const Icon(Icons.arrow_back_ios, color: Colors.white), onPressed: backButtonClick),
        titleSpacing: -30,
        //centerTitle: isMobile,
        title: Padding(
          padding: EdgeInsets
              .zero, //isMobile ? EdgeInsets.zero : const EdgeInsets.only(top: 15),
          child: Image.asset(AssetIcons.horizontalTransparentLogo, height: 45),
        ),
      ),
      //backgroundColor: CustomColors.primaryBlue);,
      // insetPadding:
      //     const EdgeInsets.only(left: 20, top: 100, right: 20, bottom: 50),
      body: Container(
        padding: const EdgeInsets.only(top: 58),
        child: CarouselSlider(
          items: [
            _wrapper(
              _first(healthService, context),
              _buttons(controller, first: true),
            ),
            _wrapper(_second(), _buttons(controller)),
            _wrapper(
              _third(proteinGoalController, goalWeightController),
              _buttons(controller),
            ),
            _wrapper(
              _fourth(goalWeightController, calorieGoalController),
              _buttons(controller),
            ),
          ],
          carouselController: controller,
          options: CarouselOptions(
            scrollPhysics: const NeverScrollableScrollPhysics(),
            height: 425,
            viewportFraction: 1,
            enableInfiniteScroll: false,
          ),
        ),
      ),
    );
  }
}
