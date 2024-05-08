import 'package:get/get.dart';
import 'package:getx_structure/modules/auth/presentation/controller/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(
        loginUseCase: Get.find(),
      ),
      fenix: true,
    );
  }
}
