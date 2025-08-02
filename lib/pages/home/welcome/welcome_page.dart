import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:procal/constants/asset_icons.dart';
import 'package:procal/constants/strings.dart';
import 'package:procal/hooks/carousel_hook.dart';
import 'package:procal/pages/home/welcome/personal_info_page.dart';
import 'package:procal/pages/home/welcome/objective_page.dart';
import 'package:procal/pages/home/welcome/weight_page.dart';
import 'package:procal/pages/home/welcome/welcome_controller.dart';
import 'package:procal/services/device_services/health_service.dart';
import 'package:toastification/toastification.dart';

enum GoalSettingMode { ai, manual }

class WelcomePage extends HookConsumerWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final healthService = ref.watch(healthServiceProvider.notifier);
    final carouselController = useCarouselSliderController();
    final index = useState(0);

    final goalSettingMode = useState<GoalSettingMode?>(GoalSettingMode.ai);

    final isNextDisabled = useState(false);
    final isFirstPageDisabled = useState(true);
    final isSecondPageDisabled = useState(true);
    final isThirdPageDisabled = useState(true);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: Image.asset(AssetIcons.horizontalTransparentLogo, height: 45),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 25.0,
            left: 20,
            right: 20,
            bottom: 10,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) => CarouselSlider(
                    carouselController: carouselController,
                    items: [
                      PersonalInfoPage(pageDisabled: isFirstPageDisabled),
                      ObjectivePage(pageDisabled: isSecondPageDisabled),
                      WeightPage(pageDisabled: isThirdPageDisabled),
                      Column(children: [Text(WelcomeStrings.letsSetYourGoals)]),
                      Column(
                        children: [
                          Text(WelcomeStrings.letsSetYourGoals),
                          const SizedBox(height: 20),
                          Text(WelcomeStrings.aiOrManual),
                          const SizedBox(height: 20),
                          ListTile(
                            title: Text(WelcomeStrings.aiGoalSetting),
                            trailing: Radio<GoalSettingMode>(
                              value: GoalSettingMode.ai,
                              groupValue: goalSettingMode.value,
                              onChanged: (value) {
                                goalSettingMode.value = value;
                              },
                            ),
                          ),
                          ListTile(
                            title: Text(WelcomeStrings.manualGoalSetting),
                            trailing: Radio(
                              value: GoalSettingMode.manual,
                              groupValue: goalSettingMode.value,
                              onChanged: (value) {
                                goalSettingMode.value = value;
                              },
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(WelcomeStrings.forTheBestExperience),
                          const SizedBox(height: 20),
                          OutlinedButton(
                            onPressed: () async {
                              final hasAccess = await healthService
                                  .requestDataAccess();
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
                                await Future.delayed(
                                  const Duration(seconds: 1),
                                );
                                await carouselController.nextPage();
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
                            child: Text(WelcomeStrings.enableHealthPermissions),
                          ),
                        ],
                      ),
                    ],
                    options: CarouselOptions(
                      onPageChanged: (idx, _) => index.value = idx,
                      height:
                          constraints.maxHeight -
                          MediaQuery.of(context).viewInsets.bottom,
                      enlargeCenterPage: true,
                      viewportFraction: 1.0,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (index.value > 0)
                    CircleAvatar(
                      child: IconButton(
                        onPressed: carouselController.previousPage,
                        icon: const Icon(Icons.arrow_back),
                      ),
                    ),
                  if (index.value == 0) const SizedBox(),
                  CircleAvatar(
                    child: IconButton(
                      onPressed: isNextDisabled.value
                          ? null
                          : () {
                              carouselController.nextPage();
                              FocusScope.of(context).unfocus();
                            },
                      icon: const Icon(Icons.arrow_forward),
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
