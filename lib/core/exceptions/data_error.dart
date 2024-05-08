import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

import '../core.dart';

class DataError implements Exception {
  DataError({
    this.code,
    this.message = 'Error message',
  });

  // Error code
  final int? code;

  // Error code format string
  final String message;

  factory DataError.unknownError() => DataError(
        code: ErrorCodes.unknownError,
      );

  factory DataError.defaultApiError() => DataError(
        code: ErrorCodes.defaultApiError,
      );

  @override
  String toString() {
    return 'DataFailure{errCode: $code, errMessage: $message}';
  }

  static Either<DataError, T> handleDioError<T>(DioException exception) {
    try {
      switch (exception.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          return Left(DataError(
            code: ErrorCodes.dioTimeout,
            message: 'Time out',
          ));
        case DioExceptionType.badCertificate:
          return Left(DataError(
            code: ErrorCodes.dioBadCertificate,
            message: exception.response?.statusMessage ?? 'Bad Certificate',
          ));
        case DioExceptionType.badResponse:
          return Left(DataError(
            code: exception.response?.statusCode ?? ErrorCodes.dioBadResponse,
            message: exception.response?.statusMessage ?? 'Bad Response',
          ));
        case DioExceptionType.cancel:
          return Left(DataError(
            code: ErrorCodes.dioCancel,
            message: exception.response?.statusMessage ?? 'Cancel ',
          ));
        case DioExceptionType.connectionError:
          return Left(DataError(
            code: ErrorCodes.dioConnectionError,
            message: exception.response?.statusMessage ?? 'Connection Error',
          ));
        case DioExceptionType.unknown:
          return Left(DataError(
            code: ErrorCodes.dioUnknown,
            message: exception.response?.statusMessage ?? 'Dio Unknown',
          ));
      }
    } catch (e) {
      return Left(DataError.defaultApiError());
    }
  }

  static Either<DataError, T> handleException<T>(Object exception) {
    try {
      if (exception is DataError) {
        return Left(exception);
      } else if (exception is DioException) {
        return handleDioError<T>(exception);
      } else {
        return Left(DataError.defaultApiError());
      }
    } catch (e) {
      return Left(DataError.unknownError());
    }
  }
}
