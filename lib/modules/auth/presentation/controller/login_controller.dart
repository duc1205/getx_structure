import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_structure/modules/auth/domain/usecases/login_usecase.dart';

class LoginController extends GetxController {
  final LoginUseCase loginUseCase;

  LoginController(this.loginUseCase);

  Future<void> handleLogin() async {
    final repsonse = await loginUseCase.login();
    repsonse.fold(
      (l) => debugPrint('Login Error'),
      (r) {
        debugPrint('Login Success');
      },
    );
  }
}
