
import 'package:osamasmovies/models/news_entity.dart';

import '../api_manager/api_manager.dart';
import '../api_manager/api_result.dart';

class MyAPICaller {
  static MyAPICaller? _shared;
  String baseURLString;


  static MyAPICaller get shared {
    if (_shared == null) {
      assert(_shared != null, "OXOAPICaller Used before Initializing");
    }
    return _shared!;
  }

  MyAPICaller(
      {required this.baseURLString,});

  static void init(
      {required String baseURLString,}) {
    if (_shared == null) {
      _shared = MyAPICaller(
          baseURLString: baseURLString,);
    } else {
      assert(_shared != null, "OXOAPICaller Initialized elsewhere.");
    }
  }


  Future<APIResult<List<NewsEntity>>> getNewsList(int pageKey, int pageSize) async {
    String urlString = "$baseURLString/news?page=$pageKey&limit=$pageSize";

    return await APIManager.shared.request<List<NewsEntity>>(
      urlString,
      isPost: false,
    );
  }

}
