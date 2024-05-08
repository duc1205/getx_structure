// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:getx_structure/core/storage_manager/local_storage/preference_manager.dart'
    as _i6;
import 'package:getx_structure/core/storage_manager/local_storage/preference_manager_impl.dart'
    as _i7;
import 'package:getx_structure/injector.dart' as _i13;
import 'package:getx_structure/modules/auth/data/datasource/auth_datasource.dart'
    as _i8;
import 'package:getx_structure/modules/auth/data/datasource/auth_datasource_impl.dart'
    as _i9;
import 'package:getx_structure/modules/auth/data/repositories/auth_remote_repository_impl.dart'
    as _i11;
import 'package:getx_structure/modules/auth/domain/repositories/auth_repository.dart'
    as _i10;
import 'package:getx_structure/modules/auth/domain/usecases/login_usecase.dart'
    as _i12;
import 'package:getx_structure/network/dio_provider.dart' as _i5;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i3;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i3.SharedPreferences>(
      () => registerModule.prefs(),
      preResolve: true,
    );
    gh.lazySingleton<_i4.Dio>(() => registerModule.getDio);
    gh.lazySingleton<_i5.DioProvider>(() => _i5.DioProvider());
    gh.lazySingleton<_i6.PreferenceManager>(() =>
        _i7.PreferenceManagerImpl(preferences: gh<_i3.SharedPreferences>()));
    gh.lazySingleton<_i8.AuthDataSource>(
        () => _i9.AuthDataSourceImpl(dio: gh<_i4.Dio>()));
    gh.lazySingleton<_i10.AuthRepository>(() => _i11.AuthRemoteRepositoryImpl(
        authDataSource: gh<_i8.AuthDataSource>()));
    gh.lazySingleton<_i12.LoginUseCase>(
        () => _i12.LoginUseCase(authRepository: gh<_i10.AuthRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i13.RegisterModule {}
