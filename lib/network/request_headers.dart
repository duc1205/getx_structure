import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../injector.dart';
import '../core/core.dart';

class RequestHeaderInterceptor extends InterceptorsWrapper {
  final SharedPreferences _preferenceManager = getIt<SharedPreferences>();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    getCustomHeaders().then((customHeaders) {
      options.headers.addAll(customHeaders);
      super.onRequest(options, handler);
    });
  }

  Future<Map<String, String>> getCustomHeaders() async {
    final String accessToken = _preferenceManager.getString(StorageKeyConstants.keyAccessToken) ?? '';

    var customHeaders = {
      'content-type': 'application/json',
    };

    if (accessToken.trim().isNotEmpty) {
      customHeaders.addAll({
        'Authorization': "Bearer $accessToken",
      });
    }

    return customHeaders;
  }
}
