import 'package:dio/dio.dart';
import 'package:get/get.dart';import 'package:getx_structure/modules/auth/data/datasource/auth_datasource.dart';
import 'package:getx_structure/modules/auth/data/datasource/auth_datasource_impl.dart';
import 'package:getx_structure/modules/auth/data/repositories/auth_remote_repository_impl.dart';
import 'package:getx_structure/modules/auth/domain/repositories/auth_repository.dart';
import 'package:getx_structure/modules/auth/domain/usecases/login_usecase.dart';
import 'package:getx_structure/modules/auth/presentation/controller/login_controller.dart';
import 'package:getx_structure/network/dio_provider.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<Dio>(DioProvider.dioWithHeaderToken);
    Get.put<AuthDataSource>(AuthDataSourceImpl(dio: Get.find()));
    Get.put<AuthRepository>(AuthRemoteRepositoryImpl(authDataSource: Get.find()));
    Get.put(LoginUseCase(authRepository: Get.find()));
    Get.lazyPut<LoginController>(() => LoginController(Get.find()));
  }
}
