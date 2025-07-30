import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:procal/constants/asset_icons.dart';
import 'package:procal/constants/strings.dart';
import 'package:procal/hooks/carousel_hook.dart';
import 'package:procal/services/device_services/health_service.dart';
import 'package:toastification/toastification.dart';

class WelcomePage extends HookConsumerWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final healthService = ref.watch(healthServiceProvider.notifier);
    final carouselController = useCarouselSliderController();
    final index = useState(0);
    final firstNameController = useTextEditingController();
    final lastNameController = useTextEditingController();
    final primaryGoal = useState<String?>(null);

    final isNextDisabled = useState(true);

    firstNameController.addListener(() {
      if (index.value == 0) {
        isNextDisabled.value = firstNameController.text.isEmpty;
      }
    });
    primaryGoal.addListener(() {
      if (index.value == 1) {
        isNextDisabled.value = primaryGoal.value == null;
      }
    });

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: Image.asset(AssetIcons.horizontalTransparentLogo, height: 45),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 50.0,
            left: 20,
            right: 20,
            bottom: 10,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SingleChildScrollView(
                child: CarouselSlider(
                  carouselController: carouselController,
                  items: [
                    Column(
                      spacing: 20.0,
                      children: [
                        Text(WelcomeStrings.welcome),
                        Text(WelcomeStrings.letsGetToKnowYou),
                        TextField(
                          controller: firstNameController,
                          textInputAction: TextInputAction.next,
                          onEditingComplete: () {
                            FocusScope.of(context).nextFocus();
                          },
                          autofillHints: const [AutofillHints.givenName],
                          decoration: InputDecoration(
                            labelText: WelcomeStrings.firstName,
                            border: const OutlineInputBorder(),
                          ),
                        ),
                        TextField(
                          controller: lastNameController,
                          textInputAction: TextInputAction.done,
                          onEditingComplete: () {
                            FocusScope.of(context).unfocus();
                            carouselController.nextPage();
                          },
                          autofillHints: const [AutofillHints.familyName],
                          decoration: InputDecoration(
                            labelText: WelcomeStrings.lastName,
                            border: const OutlineInputBorder(),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(WelcomeStrings.primaryGoal),
                        ListTile(
                          title: Text(WelcomeStrings.loseWeight),
                          trailing: Radio(
                            value: 'lose_weight',
                            groupValue: primaryGoal.value,
                            onChanged: (value) {
                              primaryGoal.value = value;
                            },
                          ),
                        ),
                        ListTile(
                          title: Text(WelcomeStrings.buildMuscle),
                          trailing: Radio(
                            value: 'build_muscle',
                            groupValue: primaryGoal.value,
                            onChanged: (value) {
                              primaryGoal.value = value;
                            },
                          ),
                        ),
                        ListTile(
                          title: Text(WelcomeStrings.maintainWeight),
                          trailing: Radio(
                            value: 'maintain_weight',
                            groupValue: primaryGoal.value,
                            onChanged: (value) {
                              primaryGoal.value = value;
                            },
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'For the best experience, it is recommended that you enable health permissions',
                        ),
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
                              await Future.delayed(const Duration(seconds: 1));
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
                    Column(
                      children: [
                        Text('Stay motivated'),
                        const SizedBox(height: 20),
                        Text('Set goals and track your progress'),
                      ],
                    ),
                    Column(
                      children: [
                        Text('Join our community'),
                        const SizedBox(height: 20),
                        Text('Connect with others on the same journey'),
                      ],
                    ),
                  ],
                  options: CarouselOptions(
                    onPageChanged: (idx, _) => index.value = idx,
                    height: MediaQuery.of(context).size.height * 0.3,
                    enlargeCenterPage: true,
                    viewportFraction: 1.0,
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
