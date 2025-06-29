import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:procal/constants/asset_icons.dart';
import 'package:procal/pages/login/common/login_text_input.dart';
import 'package:procal/pages/login/login_controller.dart';

class LoginContainer extends HookConsumerWidget {
  const LoginContainer({required this.carouselController, super.key});
  final CarouselSliderController carouselController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userNameController = useTextEditingController();
    final passwordController = useTextEditingController();
    final isSignUp = useState(false);
    final loginModel = ref.read(loginControllerProvider.notifier);
    final loginState = ref.watch(loginControllerProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
      child: Column(
        children: [
          Image.asset(AssetIcons.horizontalTransparentLogo, height: 45),
          LoginTextInput(controller: userNameController, hintText: 'Username'),
          LoginTextInput(
            controller: passwordController,
            hintText: 'Password',
            isPassword: true,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: ElevatedButton(
              child:
                  loginState.isLoading
                      ? const CircularProgressIndicator()
                      : Text(isSignUp.value ? 'Sign Up' : 'Login'),
              onPressed: () async {
                isSignUp.value
                    ? await loginModel.createUser(
                      userNameController.text,
                      passwordController.text,
                    )
                    : await loginModel.login(
                      userNameController.text,
                      passwordController.text,
                    );
              },
            ),
          ),
          TextButton(
            onPressed: () => isSignUp.value = !isSignUp.value,
            child: Text(
              isSignUp.value
                  ? 'Already have an account? Login'
                  : "Don't have an account? Sign Up",
            ),
          ),
          TextButton(
            child: const Text('Forgot Password?'),
            onPressed: () async {
              carouselController.jumpToPage(1);
            },
          ),
          if (loginState.hasError) ...[
            Text(
              loginState.error.toString(),
              style: const TextStyle(color: Colors.red),
            ),
          ],
        ],
      ),
    );
  }
}
