import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Constants {
  static const double elevation = 3;

  static String get local => GetStorage().read('local') ?? 'ar';

  static void changeLocal() {
    String newLocal = isEnglish ? 'ar' : 'en';
    GetStorage().write('local', newLocal);
    Get.updateLocale(Locale(newLocal, ''));
  }

  static bool get isEnglish => local == 'en';

  static String get getDefaultImage => "assets/images/ic_logo.png";

}
