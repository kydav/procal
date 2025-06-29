import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:procal/pages/login/common/login_text_input.dart';
import 'package:procal/pages/login/login_controller.dart';

class ForgotPasswordCodeContainer extends HookConsumerWidget {
  const ForgotPasswordCodeContainer({
    required this.carouselController,
    super.key,
  });
  final CarouselSliderController carouselController;

  @override
  Widget build(BuildContext contex, WidgetRef ref) {
    final codeController = useTextEditingController();
    final passwordController = useTextEditingController();
    final loginModel = ref.read(loginControllerProvider.notifier);
    final loginState = ref.watch(loginControllerProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
      child: Column(
        children: [
          Text('Enter the code sent to your email'),
          const SizedBox(height: 20),
          TextField(
            controller: codeController,
            decoration: InputDecoration(
              hintText: 'Verification Code',
              border: OutlineInputBorder(),
            ),
          ),
          LoginTextInput(
            controller: passwordController,
            hintText: 'Enter new password',
            isPassword: true,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: ElevatedButton(
              child: const Text('Verify Code'),
              onPressed: () async {
                await loginModel.confirmPasswordReset(
                  codeController.text,
                  passwordController.text,
                );
                carouselController.jumpToPage(1);
              },
            ),
          ),
        ],
      ),
    );
  }
}
