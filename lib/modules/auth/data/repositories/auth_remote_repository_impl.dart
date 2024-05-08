import 'package:fpdart/fpdart.dart';
import 'package:getx_structure/core/core.dart';
import 'package:getx_structure/modules/auth/data/datasource/auth_datasource.dart';
import 'package:getx_structure/modules/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRepository)
class AuthRemoteRepositoryImpl implements AuthRepository {
  final AuthDataSource _authDataSource;

  AuthRemoteRepositoryImpl({required AuthDataSource authDataSource}) : _authDataSource = authDataSource;

  @override
  Future<Either<DataError, bool>> login() async => _authDataSource.login();
}
