import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:osamasmovies/helpers/my_api_caller.dart';
import 'package:osamasmovies/models/news_entity.dart';

import '../api_manager/api_result.dart';

class NewsController extends GetxController {

  static const _pageSize = 7;
  final PagingController<int, NewsEntity> pagingController =
      PagingController(firstPageKey: 1);

  @override
  void onInit() {
    super.onInit();
    pagingController.addPageRequestListener((pageKey) {
      print('pageKey $pageKey');
      _getNewsList(pageKey);
    });
  }

  Future<void> _getNewsList(int pageKey) async {
    try {
      final result = await MyAPICaller.shared.getNewsList(pageKey, _pageSize);

      if (result.object == null) {
        pagingController.error = result.error?.message ?? '';
        return;
      }
      final newItems = result.object!;
      final isLastPage = newItems.length < _pageSize;
      if (isLastPage) {
        print('isLastPage');
        pagingController.appendLastPage(newItems);
      } else {
        print('!isLastPage');
        final nextPageKey = pageKey + 1;
        pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      pagingController.error = error;
    }
  }

  @override
  void dispose() {
    super.dispose();
    pagingController.dispose();
  }
}
