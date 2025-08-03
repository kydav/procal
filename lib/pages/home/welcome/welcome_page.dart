import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:procal/constants/asset_icons.dart';
import 'package:procal/constants/strings.dart';
import 'package:procal/pages/home/welcome/objective_page.dart';
import 'package:procal/pages/home/welcome/personal_info_page.dart';
import 'package:procal/pages/home/welcome/weight_page.dart';
import 'package:procal/services/device_services/health_service.dart';
import 'package:toastification/toastification.dart';

enum GoalSettingMode { ai, manual }

class WelcomePage extends HookConsumerWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final healthService = ref.watch(healthServiceProvider.notifier);
    final pageController = usePageController();

    final goalSettingMode = useState<GoalSettingMode?>(GoalSettingMode.ai);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: Image.asset(AssetIcons.horizontalTransparentLogo, height: 45),
      ),
      body: PageView(
        controller: pageController,
        children: [
          PersonalInfoPage(pageController: pageController),
          ObjectivePage(pageController: pageController),
          WeightPage(pageController: pageController),
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
                    await Future.delayed(const Duration(seconds: 1));
                    await pageController.nextPage(
                      duration: Durations.medium1,
                      curve: Curves.bounceIn,
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
                child: Text(WelcomeStrings.enableHealthPermissions),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
