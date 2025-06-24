import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class LoginTextInput extends HookWidget {
  const LoginTextInput({
    required this.controller,
    required this.hintText,
    this.isPassword = false,
    super.key,
  });

  final TextEditingController controller;
  final String hintText;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    final isObscured = useState(true);
    return TextFormField(
      controller: controller,
      obscureText: isPassword && isObscured.value,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon:
            isPassword
                ? isObscured.value
                    ? IconButton(
                      icon: const Icon(Icons.visibility_off),
                      onPressed: () => isObscured.value = false,
                    )
                    : IconButton(
                      icon: const Icon(Icons.visibility),
                      onPressed: () => isObscured.value = true,
                    )
                : null,
      ),
    );
  }
}
