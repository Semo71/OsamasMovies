import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:osamasmovies/api_manager/response_wrapper.dart';
import '../helpers/constants.dart';
import 'api_manager_datasource.dart';
import 'api_result.dart';
import 'network_error.dart';
import 'network_error_type.dart';

class APIManager {
  static APIManager? _shared;
  final int receiveTimeout;
  final APIManagerDatasource datasource;
  static final Dio _dio = Dio();

  static APIManager get shared {
    if (_shared == null) {
      assert(_shared != null, "API Manager Used before Initializing");
    }
    return _shared!;
  }

  APIManager({
    required this.datasource,
    required this.receiveTimeout,
  });

  static void init(
    APIManagerDatasource datasource, {
    int receiveTimeout = 30000,
  }) {
    if (_shared == null) {
      _shared = APIManager(
        datasource: datasource,
        receiveTimeout: receiveTimeout,
      );
      _dio.options.receiveTimeout = receiveTimeout;
      if (!kIsWeb) {
        (_dio.httpClientAdapter as DefaultHttpClientAdapter)
            .onHttpClientCreate = (HttpClient client) {
          client.badCertificateCallback =
              (X509Certificate cert, String host, int port) => true;
          return client;
        };
      }
    } else {
      assert(_shared != null, "API Manager Initialized elsewhere.");
    }
  }

  Future<APIResult<T>> request<T>(
    String urlEndPoint, {
        required bool isPost,
        dynamic bodyParams,
        bool showMessage = true,
        bool allowNullResponse = false,
        String contentType = 'application/json',
        int? receiveTimeout,
  }) async {

    var options = Options();
    options.receiveTimeout = receiveTimeout;
    options.method = isPost ? 'POST' : 'GET';
    options.contentType = contentType;

    Response? response;
    NetworkError? networkError;
    Uri url = Uri.parse(urlEndPoint);

    try {
      log("request: $urlEndPoint");
      try {
        log("bodyParams: $bodyParams");
      } catch (e) {
        log("${e.toString()}");
      }
      response = await _dio.request(
        urlEndPoint,
        data: bodyParams,
        options: options,
      );
      log("response: ${response.statusCode} ${url.toString()}");
      log("body: ${response.data.toString()}");
    } on DioError catch (e) {
      print(e.response);
      log('${e.requestOptions}');
      log(e.message);
      log("response: ${e.message} $urlEndPoint");

      networkError = NetworkError(
          type: NetworkErrorType.general,
          showMessage: showMessage,
          message:
          '${Constants.isEnglish ? 'Something went wrong' : 'حدث خطأ ما'}  ${e.response?.statusCode?.toString()??''} ${e.message}');

       if (e.error is SocketException) {
        networkError = NetworkError(
            type: NetworkErrorType.noConnection,
            showMessage: showMessage,
            message: Constants.isEnglish
                ? 'Check your internet connection'
                : 'تأكد من اتصالك بالانترنت');
      }

      if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.sendTimeout ||
          e.type == DioErrorType.receiveTimeout) {
        networkError = NetworkError(
            type: NetworkErrorType.general,
            showMessage: showMessage,
            message: Constants.isEnglish
                ? 'Request timeout, please try again'
                : 'انتهت مدة الاتصال، الرجاء المحاولة مرة أخرى');
      }

    }

    if (networkError != null) {
      throwError(networkError);
      return APIResult.error(networkError);
    } else {
      if ((response == null || response.statusCode == 204) &&
          !allowNullResponse) {
        var networkError = NetworkError(
          type: NetworkErrorType.general,
          message: '${response!.statusCode} No Content',
          showMessage: showMessage,
        );
        throwError(networkError);
        return APIResult.error(networkError);
      }
      if (response == null || response.statusCode == 204) {
        return APIResult.object(null);
      }
      var wrapper = ResponseWrapper<T>();
      var object = wrapper.fromJson(response.data);
      return APIResult.object(object);
    }
  }

  void throwError(NetworkError error) {
    datasource.onError(error);
  }
}
