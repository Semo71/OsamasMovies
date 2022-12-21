
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../generated/json/base/json_convert_content.dart';
import '../generated/json/base/json_field.dart';

class ResponseWrapper<T> {

  ResponseWrapper();

  T? fromJson(dynamic json) {
    var value = JsonConvert.fromJsonAsT<T>(json);
    return value;
  }

}