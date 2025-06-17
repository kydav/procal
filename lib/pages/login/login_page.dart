import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final authService = ref.read(authServiceProvider);
    final userNameController = useTextEditingController();
    final passwordController = useTextEditingController();
    return Material(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
          child: Column(
            children: [
              TextFormField(controller: userNameController),
              TextFormField(controller: passwordController),
              ElevatedButton(child: const Text('Submit'), onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
