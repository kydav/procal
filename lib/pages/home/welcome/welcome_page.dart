import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:procal/constants/asset_icons.dart';
import 'package:procal/pages/home/welcome/ai_goal_page.dart';
import 'package:procal/pages/home/welcome/goal_setting_mode_page.dart';
import 'package:procal/pages/home/welcome/objective_page.dart';
import 'package:procal/pages/home/welcome/personal_info_page.dart';
import 'package:procal/pages/home/welcome/weight_page.dart';

class WelcomePage extends HookConsumerWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageController = usePageController();

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
          GoalSettingModePage(pageController: pageController),
          AiGoalPage(pageController: pageController),
        ],
      ),
    );
  }
}
