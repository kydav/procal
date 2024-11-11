import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:procal/constants/strings.dart';
import 'package:procal/hooks/carousel_hook.dart';
import 'package:procal/services/device_services/health_service.dart';
import 'package:procal/top_level_providers.dart';
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
                icon: const Icon(Icons.arrow_back_ios)),
          if (first) const SizedBox(),
          IconButton(
              onPressed: () {
                controller.nextPage();
              },
              icon: const Icon(Icons.arrow_forward_ios))
        ],
      );

  Column _first(CarouselSliderController controller,
          HealthService healthService, BuildContext context) =>
      Column(
        children: [
          Text('Welcome to ProCal Tracker!'),
          Text("Let's get started"),
          Text('For the best ProCal Experience, please enable Health Access'),
          Text('We will only ever write and read your protein and calories'),
          TextButton(
              onPressed: () async {
                final hasAccess = await healthService.requestDataAccess();
                if (hasAccess && context.mounted) {
                  toastification.show(
                    context: context,
                    title: Text(Strings.toastHealthGranted),
                    type: ToastificationType.success,
                    style: ToastificationStyle.fillColored,
                    alignment: Alignment.bottomCenter,
                    autoCloseDuration: const Duration(seconds: 3),
                    showProgressBar: false,
                  );
                } else if (context.mounted) {
                  toastification.show(
                    context: context,
                    title: Text(Strings.toastHealthDenied),
                    type: ToastificationType.error,
                    style: ToastificationStyle.fillColored,
                    alignment: Alignment.bottomCenter,
                    autoCloseDuration: const Duration(seconds: 3),
                    showProgressBar: false,
                  );
                }
              },
              child: Text('Enable Access')),
          _buttons(controller, first: true)
        ],
      );

  Column _second(CarouselSliderController controller) => Column(
        children: [Text('page two'), _buttons(controller)],
      );

  Column _third(
          TextEditingController proteinGoalController,
          TextEditingController goalWeightController,
          CarouselSliderController controller) =>
      Column(
        children: [
          Text("Now let's set your Protein Goal"),
          Text(
              'ProCal recommends setting your Protein Goal to 1 gram of Protein per pound of goal weight'),
          Text("Enter your goal weight:"),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            child: TextField(
              textAlign: TextAlign.center,
              controller: goalWeightController,
            ),
          ),
          Text('Your recommended Protein Goal is:'),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            child: TextField(
              textAlign: TextAlign.center,
              controller: proteinGoalController,
            ),
          ),
          _buttons(controller)
        ],
      );

  Column _fourth(
          TextEditingController proteinGoalController,
          TextEditingController goalWeightController,
          CarouselSliderController controller) =>
      Column(
        children: [
          Text("Now your calorie goal"),
          Text(
              'While setting your calorie goal quite low will help lose initial weight'),
          Text("Procal recommends setting your calorie goal higher initially"),
          Text(
              "While enlisting in weight training and then doing periods of lower calories"),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            child: TextField(
              textAlign: TextAlign.center,
              controller: goalWeightController,
            ),
          ),
          Text('Your recommended Protein Goal is:'),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            child: TextField(
              textAlign: TextAlign.center,
              controller: proteinGoalController,
            ),
          ),
          _buttons(controller)
        ],
      );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final healthService = ref.read(healthServiceProvider);

    final controller = useCarouselSliderController();
    final goalWeightController = useTextEditingController();
    final proteinGoalController = useTextEditingController();
    goalWeightController.addListener(
        () => proteinGoalController.value = goalWeightController.value);
    return Scaffold(
      // insetPadding:
      //     const EdgeInsets.only(left: 20, top: 100, right: 20, bottom: 50),
      body: Container(
          padding: const EdgeInsets.only(
            top: 58,
          ),
          child: CarouselSlider(
              items: [
                _first(controller, healthService, context),
                _second(controller),
                _third(proteinGoalController, goalWeightController, controller)
              ],
              carouselController: controller,
              options: CarouselOptions(
                scrollPhysics: const NeverScrollableScrollPhysics(),
                height: 425,
                viewportFraction: 1,
                enableInfiniteScroll: false,
              ))),
    );
  }
}
