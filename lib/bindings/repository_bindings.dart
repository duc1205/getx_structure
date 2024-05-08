import 'package:get/get.dart';
import 'package:getx_structure/modules/auth/data/repositories/auth_remote_repository_impl.dart';
import 'package:getx_structure/modules/auth/domain/repositories/auth_repository.dart';

class RepositoryBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<AuthRepository>(
        AuthRemoteRepositoryImpl(authDataSource: Get.find()));
  }
}
