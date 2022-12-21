
import 'package:dio/dio.dart';
import 'network_error_type.dart';

class NetworkError implements Exception {
  NetworkErrorType type;
  String? message;
  bool showMessage;
  DioError? error;
  NetworkError({required this.type, required this.showMessage, this.message,this.error});

  int? get code {
    return error?.response?.statusCode;
  }

  String description() {
    return "";
  }
}