import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';

import '/network/request_headers.dart';

@lazySingleton
class DioProvider {
  static String baseUrl = 'http://localhost:3000';

  static Dio? _instance;

  static final BaseOptions _options = BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 30),
  );

  static Dio get httpDio {
    if (_instance == null) {
      _instance = Dio(_options);

      return _instance!;
    }
    _instance!.interceptors.clear();

    return _instance!;
  }

  ///returns a Dio client with Access token in header
  static Dio get tokenClient {
    _addInterceptors();

    return _instance!;
  }

  ///returns a Dio client with Access token in header
  ///Also adds a token refresh interceptor which retry the request when it's unauthorized
  static Dio get dioWithHeaderToken {
    _addInterceptors();

    return _instance!;
  }

  static _addInterceptors() {
    _instance ??= httpDio;
    _instance!.interceptors.add(RequestHeaderInterceptor());
    if (kDebugMode) {
      _instance!.interceptors.add(
        TalkerDioLogger(
          settings: const TalkerDioLoggerSettings(
            printRequestHeaders: true,
          ),
        ),
      );
    }
  }
}
