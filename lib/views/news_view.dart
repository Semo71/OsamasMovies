import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:osamasmovies/components/custom_colors.dart';
import 'package:osamasmovies/controller/news_controller.dart';
import 'package:osamasmovies/models/news_entity.dart';
import '../components/i_text.dart';
import '../controller/home_controller.dart';
import '../generated/l10n.dart';
import '../helpers/constants.dart';
import '../helpers/date_format_manager.dart';

class NewsView extends StatelessWidget {
  NewsView({Key? key}) : super(key: key);

  final controller = Get.put(NewsController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 5,),
        Expanded(
          child: RefreshIndicator(
            onRefresh: () async => controller.pagingController.refresh(),
            child: PagedListView<int, NewsEntity>(
              pagingController: controller.pagingController,
              builderDelegate: PagedChildBuilderDelegate<NewsEntity>(
                itemBuilder: (context, item, index) => getItem(
                  item,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget getItem(NewsEntity entity) => Row(
        children: [
          Expanded(
            flex: 2,
            child: Card(
              elevation: 1,
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              clipBehavior: Clip.antiAlias,
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                width: double.infinity,
                imageUrl: entity.image ?? '',
                placeholder: (context, url) => Image(
                  image: AssetImage(Constants.getDefaultImage),
                ),
                errorWidget: (context, url, error) => Image(
                  image: AssetImage(Constants.getDefaultImage),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IText(
                  entity.title,
                  maxLines: 1,
                  color: CustomColors.gray7,
                  minFontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(
                  height: 7,
                ),
                IText(
                  entity.content,
                  maxLines: 2,
                  color: CustomColors.black,
                  minFontSize: 14,
                  lineSpacing: 1.3,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(
                  height: 7,
                ),
                IText(
                  DateManager.format(entity.createdAt,
                      requiredFormat:
                      DateManager.DAY_MONTH_YEAR_SPACE),
                  maxLines: 1,
                  color: CustomColors.gray7,
                  minFontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          ),
        ],
      );
}
