import 'package:dio/dio.dart';

class RequestHeaderInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    getCustomHeaders().then((customHeaders) {
      options.headers.addAll(customHeaders);
      super.onRequest(options, handler);
    });
  }

  Future<Map<String, String>> getCustomHeaders() async {
    var customHeaders = {
      'content-type': 'application/json',
    };

    // TODO: Handle later

    // if (accessToken.trim().isNotEmpty) {
    //   customHeaders.addAll({
    //     'Authorization': "Bearer $accessToken",
    //   });
    // }

    return customHeaders;
  }
}
