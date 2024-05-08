import 'package:get/get.dart';
import 'package:getx_structure/modules/auth/presentation/bingdings/login_binding.dart';
import 'package:getx_structure/modules/home/presentation/bindings/home_binding.dart';
import 'package:getx_structure/modules/auth/presentation/login_view.dart';
import 'package:getx_structure/modules/home/presentation/home_page.dart';

part 'app_router.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.INITIAL,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
  ];
}
