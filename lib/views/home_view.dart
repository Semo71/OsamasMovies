import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:osamasmovies/components/custom_colors.dart';
import 'package:osamasmovies/controller/main_navigation_controller.dart';
import 'package:osamasmovies/helpers/extensions.dart';
import '../components/i_text.dart';
import '../controller/home_controller.dart';
import '../generated/l10n.dart';
import '../helpers/constants.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: CustomColors.colorPrimary,
            child: SafeArea(
              child: Container(
                height: 40,
                width: 40,
                margin: const EdgeInsets.only(top: 10, bottom: 20,),
                child: Image.asset(Constants.getDefaultImage),
              ),
            ),
          ),
          RefreshIndicator(
            onRefresh: () => controller.getNewsList(),
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        IText(
                          S.of(context).latestNews,
                          maxLines: 1,
                          color: CustomColors.black,
                          minFontSize: 20,
                        ),
                        const Spacer(),
                        TextButton(
                          onPressed: () {
                            var controller = Get.find<MainNavigationController>();
                            controller.updateIndex(2);
                          },
                          child: IText(
                            S.of(context).more,
                            maxLines: 1,
                            color: CustomColors.blue,
                            minFontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Obx(() {
                      return Card(
                        elevation: Constants.elevation,
                        margin: EdgeInsets.zero,
                        color: Colors.white,
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        child: CarouselSlider(
                          options: CarouselOptions(
                              aspectRatio: 1.8 / 1,
                              viewportFraction: 1,
                              initialPage: 0,
                              autoPlay: controller.autoPlay.value,
                              pageSnapping: true,
                              pauseAutoPlayInFiniteScroll: true,
                              enlargeCenterPage: false,
                              onPageChanged: (index, reason) {
                                controller.sliderIndex.value = index;
                                if (reason ==
                                    CarouselPageChangedReason.manual) {
                                  controller.autoPlay.value = false;
                                }
                              }),
                          items: (controller.newsList.value.object ?? [])
                              .map((element) {
                            return InkWell(
                              onTap: () {},
                              child: CachedNetworkImage(
                                fit: BoxFit.cover,
                                width: double.infinity,
                                imageUrl: element.image ?? '',
                                placeholder: (context, url) => Image(
                                  image: AssetImage(Constants.getDefaultImage),
                                ),
                                errorWidget: (context, url, error) => Image(
                                  image: AssetImage(Constants.getDefaultImage),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      );
                    }),
                    const SizedBox(
                      height: 20,
                    ),
                    Obx(() {
                      return IText(
                        controller.newsList.value.object?.tryToGet(controller.sliderIndex.value)?.title,
                        maxLines: 1,
                        color: CustomColors.gray7,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      );
                    }),
                    const SizedBox(
                      height: 15,
                    ),
                    Obx(() {
                      return IText(
                        controller.newsList.value.object?.tryToGet(controller.sliderIndex.value)?.content,
                        maxLines: 1,
                        color: CustomColors.black,
                        minFontSize: 18,
                        fontWeight: FontWeight.bold,
                      );
                    }),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
