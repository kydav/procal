import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:procal/constants/asset_icons.dart';
import 'package:procal/hooks/carousel_hook.dart';
import 'package:procal/pages/login/forgot_password_container.dart';
import 'package:procal/pages/login/login_container.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage({this.isSignUp = false, super.key});

  final bool isSignUp;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useCarouselSliderController();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: Image.asset(AssetIcons.horizontalTransparentLogo, height: 45),
        centerTitle: true,
      ),
      body: CarouselSlider(
        carouselController: controller,
        options: CarouselOptions(
          height: MediaQuery.of(context).size.height * 0.7,
          scrollPhysics: const NeverScrollableScrollPhysics(),
          viewportFraction: 1,
          enableInfiniteScroll: false,
        ),

        items: [
          LoginContainer(carouselController: controller, signUp: isSignUp),
          ForgotPasswordContainer(carouselController: controller),
          //ForgotPasswordCodeContainer(carouselController: controller),
        ],
      ),
    );
  }
}
