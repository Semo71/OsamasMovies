import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:osamasmovies/helpers/my_api_caller.dart';
import 'package:osamasmovies/models/news_entity.dart';

import '../api_manager/api_result.dart';


class HomeController extends GetxController {

  var newsList = APIResult<List<NewsEntity>>().obs;
  var sliderIndex = 0.obs;
  var autoPlay = true.obs;


  @override
  void onInit() {
    super.onInit();
    getNewsList();
  }

  Future<void> getNewsList() async {
    newsList.value = await MyAPICaller.shared.getNewsList(1, 5);
  }


}
