import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_structure/modules/auth/presentation/controller/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: TextButton(
        onPressed: () {
          controller.handleLogin();
        },
        child: const Text(
          'Click',
        ),
      ),
    ));
  }
}
