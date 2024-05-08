import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:getx_structure/core/base/base_remote_source.dart';
import 'package:getx_structure/modules/auth/data/datasource/auth_datasource.dart';

import '../../../../core/core.dart';

class AuthDataSourceImpl extends BaseRemoteDataSource
    implements AuthDataSource {
  final Dio _dio;

  AuthDataSourceImpl({required Dio dio}) : _dio = dio;

  @override
  Future<Either<DataError, bool>> login() async {
    try {
      await _dio.post('https://api.escuelajs.co/api/v1/auth/login', data: {
        "email": "john@mail.com",
        "password": "changeme",
      });
      return const Right(true);
    } catch (_) {
      return Left(DataError());
    }
  }
}
