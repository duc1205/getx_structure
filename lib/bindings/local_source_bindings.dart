import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class LocalSourceBindings implements Bindings {
  @override
  Future<void> dependencies() async {
    Get.put<FlutterSecureStorage>(const FlutterSecureStorage());
  }
}
