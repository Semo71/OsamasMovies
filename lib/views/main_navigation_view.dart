import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:osamasmovies/components/custom_colors.dart';
import 'package:osamasmovies/controller/main_navigation_controller.dart';
import 'package:osamasmovies/views/home_view.dart';
import '../generated/l10n.dart';
import 'media_centre_view.dart';
import 'more_view.dart';

class MainNavigationView extends StatelessWidget {
  MainNavigationView({
    Key? key,
  }) : super(key: key);

  final List<Widget> screens = [
    HomeView(),
    MediaCentreView(),
    MoreView(),
  ];

  @override
  Widget build(BuildContext context) {
    List<String> titles = [
      S.of(context).home,
      S.of(context).favorite,
      S.of(context).settings,
    ];

    return GetBuilder<MainNavigationController>(
        init: MainNavigationController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(toolbarHeight: 0,),
            body: screens[controller.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: CustomColors.colorPrimary,
              selectedItemColor: CustomColors.white,
              unselectedItemColor: CustomColors.gray5,
              currentIndex: controller.currentIndex,
              onTap: controller.updateIndex,
              items: [
                BottomNavigationBarItem(
                  icon: const Icon(
                    Icons.home,
                  ),
                  label: titles[0],
                ),
                BottomNavigationBarItem(
                  icon: const Icon(
                    Icons.favorite_border,
                  ),
                  label: titles[1],
                ),
                BottomNavigationBarItem(
                  icon: const Icon(
                    Icons.settings,
                  ),
                  label: titles[2],
                ),
              ],
            ),
          );
        });
  }
}
