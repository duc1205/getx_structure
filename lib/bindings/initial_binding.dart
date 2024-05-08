import 'package:get/get.dart';
import 'package:getx_structure/bindings/usecase_bindings.dart';

import 'local_source_bindings.dart';
import 'remote_source_bindings.dart';
import 'repository_bindings.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() async {
    await LocalSourceBindings().dependencies();
    RemoteSourceBindings().dependencies();
    RepositoryBindings().dependencies();
    UseCaseBindings().dependencies();
  }
}
