import 'package:get/get.dart';
import 'package:getx_structure/modules/home/presentation/controller/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() {
      return HomeController();
    });
  }
}
