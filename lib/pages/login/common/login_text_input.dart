import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class LoginTextInput extends HookWidget {
  const LoginTextInput({
    required this.controller,
    required this.focusNode,
    required this.hintText,
    this.isPassword = false,
    this.textInputAction,
    this.onFieldSubmitted,
    this.validator,
    this.onChanged,
    this.error,
    super.key,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final String hintText;
  final bool isPassword;
  final TextInputAction? textInputAction;
  final void Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;
  final String? error;

  @override
  Widget build(BuildContext context) {
    final isObscured = useState(true);
    return TextFormField(
      controller: controller,
      obscureText: isPassword && isObscured.value,
      enableSuggestions: !isPassword,
      autocorrect: false,
      keyboardType:
          isPassword ? TextInputType.visiblePassword : TextInputType.text,
      textInputAction: textInputAction,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        errorText: error,
        errorStyle: const TextStyle(fontSize: 10, color: Colors.red),
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
