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
    final focusNode = useFocusNode();
    final loginModel = ref.read(loginControllerProvider.notifier);
    final loginState = ref.watch(loginControllerProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
      child: Column(
        children: [
          const Center(
            child: Text(
              'Please enter your email and we will send you an email to reset your password.',
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20.0),
            child: LoginTextInput(
              controller: userNameController,
              focusNode: focusNode,
              hintText: 'Email',
              onFieldSubmitted: (email) async {
                await loginModel.sendPasswordResetEmail(email);
                carouselController.jumpToPage(0);
              },
            ),
          ),
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
                carouselController.jumpToPage(0);
              },
            ),
          ),
        ],
      ),
    );
  }
}
