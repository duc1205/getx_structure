import 'dart:math';

import 'package:dio/dio.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:getx_structure/services/network/dio_provider.dart';

abstract class BaseRemoteDataSource {
  Dio get dioClient => DioProvider.dioWithHeaderToken;

  Future<Response<T>> callApiWithErrorParser<T>(Future<Response<T>> api) async {
    try {
      Response<T> response = await api;

      if (response.statusCode != HttpStatus.ok || (response.data as Map<String, dynamic>)['statusCode'] != HttpStatus.ok) {
        //
        print(response.data);
      }

      return response;
    } on DioException catch (dioError) {
      // TODO: Need handle
      switch (dioError.type) {
        case DioExceptionType.connectionTimeout:
          break;
        case DioExceptionType.sendTimeout:
        // TODO: Handle this case.
        case DioExceptionType.receiveTimeout:
        // TODO: Handle this case.
        case DioExceptionType.badCertificate:
        // TODO: Handle this case.
        case DioExceptionType.badResponse:
        // TODO: Handle this case.
        case DioExceptionType.cancel:
        // TODO: Handle this case.
        case DioExceptionType.connectionError:
        // TODO: Handle this case.
        case DioExceptionType.unknown:
        // TODO: Handle this case.
      }
      throw dioError;
    } catch (error) {
      // TODO: Need handle

      throw error;
    }
  }
}
