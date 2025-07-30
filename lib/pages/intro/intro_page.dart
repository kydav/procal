import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:procal/constants/asset_icons.dart';
import 'package:procal/constants/asset_images.dart';
import 'package:procal/constants/strings.dart';
import 'package:procal/constants/system_strings.dart';
import 'package:procal/constants/text_styles.dart';
import 'package:procal/hooks/carousel_hook.dart';
import 'package:procal/procal_router.dart';
import 'package:procal/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroPage extends HookConsumerWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useCarouselSliderController();

    return Scaffold(
      appBar: AppBar(backgroundColor: Theme.of(context).colorScheme.surface),
      body: Column(
        children: [
          Text(IntroStrings.welcome, style: TextStyles.menuTitle),
          Padding(
            padding: EdgeInsets.zero,
            child: Image.asset(
              AssetIcons.horizontalTransparentLogo,
              height: 45,
            ),
          ),
          Text(
            IntroStrings.proteinAndCalorieTracker,
            style: TextStyles.menuTitle,
          ),
          const SizedBox(height: 20),
          Expanded(
            child: CarouselSlider(
              items: [
                Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.asset(
                        AssetImages.stockFoodIntro,
                        height: 400,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                        right: 25.0,
                        left: 25.0,
                      ),
                      child: Text(
                        textAlign: TextAlign.center,
                        style: TextStyles.semiboldTitle,
                        IntroStrings.aNewKindOfTracker,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.asset(AssetImages.stockAIIntro, height: 400),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                        right: 25.0,
                        left: 25.0,
                      ),
                      child: Text(
                        textAlign: TextAlign.center,
                        IntroStrings.aiIntegration,
                        style: TextStyles.semiboldTitle,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.asset(
                        AssetImages.stockAthleteIntro,
                        height: 400,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                        right: 25.0,
                        left: 25.0,
                      ),
                      child: Text(
                        textAlign: TextAlign.center,
                        IntroStrings.helpingYou,
                        style: TextStyles.semiboldTitle,
                      ),
                    ),
                  ],
                ),
              ],
              carouselController: controller,
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height * 0.7,
                enableInfiniteScroll: false,
              ),
            ),
          ),
          FilledButton(
            onPressed: () async {
              final prefs = await SharedPreferences.getInstance();
              await prefs.setBool(SystemStrings.shownLoginIntro, true);
              ref.read(procalRouterProvider).go(Routes.login.path);
            },
            child: Text(GeneralStrings.login),
          ),
          OutlinedButton(
            onPressed: () async {
              final prefs = await SharedPreferences.getInstance();
              await prefs.setBool(SystemStrings.shownLoginIntro, true);
              ref.read(procalRouterProvider).pushReplacement('/login/true');
            },
            child: Text(GeneralStrings.signUp),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
