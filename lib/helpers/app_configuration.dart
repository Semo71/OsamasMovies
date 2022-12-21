import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import 'package:osamasmovies/helpers/my_api_caller.dart';
import '../api_manager/api_manager.dart';
import '../api_manager/api_manager_datasource.dart';
import '../api_manager/network_error.dart';
import '../components/dialogs.dart';
import '../generated/l10n.dart';

class AppConfiguration implements APIManagerDatasource {
  static String baseURL = "https://615d4dea12571a001720752d.mockapi.io";

  static AppConfiguration? _shared;

  static void init() {
    _shared ??= AppConfiguration._();
  }

  static AppConfiguration get shared {
    if (_shared == null) {
      assert(_shared != null, "AppConfiguration has not been initialize");
    }
    return _shared!;
  }

  AppConfiguration._() {
    APIManager.init(this);
    MyAPICaller.init(
      baseURLString: baseURL,
    );
  }

  @override
  void onError(NetworkError error) {
    if (error.showMessage) {
      showMessageDialog(
        error.message ?? "",
        title: S.current.somethingWentWrong,
      );
    }
  }
}
