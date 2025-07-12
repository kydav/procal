import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:procal/pages/login/common/login_form_controller.dart';
import 'package:procal/pages/login/common/login_text_input.dart';
import 'package:procal/pages/login/login_controller.dart';

class LoginContainer extends HookConsumerWidget {
  const LoginContainer({required this.carouselController, super.key});
  final CarouselSliderController carouselController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usernameController = useTextEditingController();
    final passwordController = useTextEditingController();
    final usernameFocusNode = useFocusNode();
    final passwordFocusNode = useFocusNode();
    final isSignUp = useState(false);
    final loginModel = ref.read(loginControllerProvider.notifier);
    final loginState = ref.watch(loginControllerProvider);

    final loginFormModel = ref.read(loginFormControllerProvider.notifier);
    final loginFormState = ref.watch(loginFormControllerProvider);
    final formKey = useMemoized(GlobalKey<FormState>.new, const []);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
      child: Form(
        key: formKey,
        child: AutofillGroup(
          child: Column(
            children: [
              LoginTextInput(
                controller: usernameController,
                focusNode: usernameFocusNode,
                textInputAction: TextInputAction.next,
                validator: loginFormModel.validateEmail,
                error: loginFormState.email.error,
                onChanged: (_) => loginFormModel.clearEmailValidation(),
                onFieldSubmitted: (_) {
                  usernameFocusNode.unfocus();
                  passwordFocusNode.requestFocus();
                },
                hintText: 'Email',
              ),
              LoginTextInput(
                controller: passwordController,
                focusNode: passwordFocusNode,
                textInputAction: TextInputAction.done,
                validator: loginFormModel.validatePassword,
                error: loginFormState.password.error,
                onChanged: (_) => loginFormModel.clearPasswordValidation(),
                onFieldSubmitted:
                    (_) =>
                        isSignUp.value
                            ? loginModel.createUser(
                              usernameController.text,
                              passwordController.text,
                            )
                            : loginModel.login(
                              usernameController.text,
                              passwordController.text,
                            ),
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
                    if (formKey.currentState!.validate() &&
                        loginFormModel.isValid()) {
                      isSignUp.value
                          ? await loginModel.createUser(
                            usernameController.text,
                            passwordController.text,
                          )
                          : await loginModel.login(
                            usernameController.text,
                            passwordController.text,
                          );
                    }
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
        ),
      ),
    );
  }
}
