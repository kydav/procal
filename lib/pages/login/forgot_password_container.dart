import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:procal/pages/login/common/login_text_input.dart';
import 'package:procal/pages/login/login_controller.dart';

class ForgotPasswordContainer extends HookConsumerWidget {
  const ForgotPasswordContainer({required this.carouselController, super.key});
  final CarouselSliderController carouselController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userNameController = useTextEditingController();
    final loginModel = ref.read(loginControllerProvider.notifier);
    final loginState = ref.watch(loginControllerProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
      child: Column(
        children: [
          LoginTextInput(controller: userNameController, hintText: 'Email'),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: ElevatedButton(
              child:
                  loginState.isLoading
                      ? const CircularProgressIndicator()
                      : const Text('Send Reset Email'),
              onPressed: () async {
                await loginModel.sendPasswordResetEmail(
                  userNameController.text,
                );
                await carouselController.nextPage();
              },
            ),
          ),
        ],
      ),
    );
  }
}
