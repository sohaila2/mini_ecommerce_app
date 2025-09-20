// ignore_for_file: constant_identifier_names, non_constant_identifier_names, unreachable_switch_case

import 'dart:io';
import 'package:dio/dio.dart';
import '../api_constants.dart';
import 'api_error_model.dart';

class ResponseCode {
  static const int SUCCESS = 200;
  static const int NO_CONTENT = 204;
  static const int BAD_REQUEST = 400;
  static const int UNAUTHORIZED = 401;
  static const int FORBIDDEN = 403;
  static const int NOT_FOUND = 404;
  static const int INTERNAL_SERVER_ERROR = 500;

  // Local status codes
  static const int CONNECT_TIMEOUT = -1;
  static const int SEND_TIMEOUT = -2;
  static const int RECEIVE_TIMEOUT = -3;
  static const int CANCEL = -4;
  static const int NO_INTERNET = -5;
  static const int DEFAULT = -6;
}

class ResponseMessage {
  static const String BAD_REQUEST = ApiErrors.badRequestError;
  static const String UNAUTHORIZED = ApiErrors.unauthorizedError;
  static const String FORBIDDEN = ApiErrors.forbiddenError;
  static const String NOT_FOUND = ApiErrors.notFoundError;
  static const String INTERNAL_SERVER_ERROR = ApiErrors.internalServerError;

  static const String CONNECT_TIMEOUT = ApiErrors.timeoutError;
  static const String SEND_TIMEOUT = ApiErrors.timeoutError;
  static const String RECEIVE_TIMEOUT = ApiErrors.timeoutError;
  static const String CANCEL = ApiErrors.requestCancelled;
  static const String NO_INTERNET = ApiErrors.noInternetError;
  static const String DEFAULT = ApiErrors.defaultError;
}

class ErrorHandler implements Exception {
  late ApiErrorModel apiErrorModel;

  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      apiErrorModel = _handleDioError(error);
    } else {
      apiErrorModel = ApiErrorModel(
        code: ResponseCode.DEFAULT,
        message: ResponseMessage.DEFAULT,
      );
    }
  }
}

ApiErrorModel _handleDioError(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return ApiErrorModel(
        code: ResponseCode.CONNECT_TIMEOUT,
        message: ResponseMessage.CONNECT_TIMEOUT,
      );
    case DioExceptionType.sendTimeout:
      return ApiErrorModel(
        code: ResponseCode.SEND_TIMEOUT,
        message: ResponseMessage.SEND_TIMEOUT,
      );
    case DioExceptionType.receiveTimeout:
      return ApiErrorModel(
        code: ResponseCode.RECEIVE_TIMEOUT,
        message: ResponseMessage.RECEIVE_TIMEOUT,
      );
    case DioExceptionType.cancel:
      return ApiErrorModel(
        code: ResponseCode.CANCEL,
        message: ResponseMessage.CANCEL,
      );
    case DioExceptionType.badResponse:
      return ApiErrorModel(
        code: error.response?.statusCode ?? ResponseCode.DEFAULT,
        message: error.response?.statusMessage ?? ResponseMessage.DEFAULT,
      );
    case DioExceptionType.connectionError:
      if (error.error is SocketException) {
        return ApiErrorModel(
          code: ResponseCode.NO_INTERNET,
          message: ResponseMessage.NO_INTERNET,
        );
      }
      return ApiErrorModel(
        code: ResponseCode.DEFAULT,
        message: ResponseMessage.DEFAULT,
      );
    default:
      return ApiErrorModel(
        code: ResponseCode.DEFAULT,
        message: ResponseMessage.DEFAULT,
      );
  }
}
