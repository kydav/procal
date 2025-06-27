import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:procal/constants/asset_icons.dart';
import 'package:procal/pages/login/common/login_text_input.dart';
import 'package:procal/pages/login/login_controller.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userNameController = useTextEditingController();
    final passwordController = useTextEditingController();
    final isSignUp = useState(false);
    final loginModel = ref.read(loginControllerProvider.notifier);
    final loginState = ref.watch(loginControllerProvider);

    return Material(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
          child: Column(
            children: [
              Image.asset(AssetIcons.horizontalTransparentLogo, height: 45),
              LoginTextInput(
                controller: userNameController,
                hintText: 'Username',
              ),
              LoginTextInput(
                controller: passwordController,
                hintText: 'Password',
                isPassword: true,
              ),
              ElevatedButton(
                child: Text(isSignUp.value ? 'Sign Up' : 'Login'),
                onPressed: () async {
                  // final future =
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
              TextButton(
                onPressed: () => isSignUp.value = !isSignUp.value,
                child: Text(
                  isSignUp.value
                      ? 'Already have an account? Login'
                      : "Don't have an account? Sign Up",
                ),
              ),
              if (loginState.isLoading) ...[
                const CircularProgressIndicator(),
              ] else if (loginState.hasError) ...[
                Text(
                  loginState.error.toString(),
                  style: const TextStyle(color: Colors.red),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
