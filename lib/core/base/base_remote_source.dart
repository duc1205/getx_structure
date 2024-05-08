import 'package:dio/dio.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:getx_structure/services/network/dio_provider.dart';

abstract class BaseRemoteDataSource {
  Dio get dioClient => DioProvider.dioWithHeaderToken;

  Future<Response<T>> callApiWithErrorParser<T>(Future<Response<T>> api) async {
    try {
      Response<T> response = await api;

      if (response.statusCode != HttpStatus.ok ||
          (response.data as Map<String, dynamic>)['statusCode'] !=
              HttpStatus.ok) {
        //
      }

      return response;
    } on DioException catch (dioError) {
      // TODO: Need handle
      throw dioError;
    } catch (error) {
      // TODO: Need handle

      throw error;
    }
  }
}
