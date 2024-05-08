import 'package:get/get.dart';
import 'package:getx_structure/modules/auth/data/datasource/auth_datasource.dart';
import 'package:getx_structure/modules/auth/data/datasource/auth_datasource_impl.dart';
import 'package:getx_structure/services/network/dio_provider.dart';

class RemoteSourceBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(DioProvider.dioWithHeaderToken);
    Get.put<AuthDataSource>(AuthDataSourceImpl(dio: Get.find()));
  }
}
