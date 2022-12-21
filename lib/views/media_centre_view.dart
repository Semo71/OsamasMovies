import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:osamasmovies/components/custom_colors.dart';
import 'package:osamasmovies/views/news_view.dart';
import '../generated/l10n.dart';
import '../helpers/constants.dart';

class MediaCentreView extends StatelessWidget {
  const MediaCentreView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          color: CustomColors.colorPrimary,
          child: SafeArea(
            child: Container(
              height: 30,
              width: 30,
              margin: const EdgeInsets.only(top: 5,),
              child: Image.asset(Constants.getDefaultImage),
            ),
          ),
        ),
        Expanded(
          child: DefaultTabController(
            length: 3,
            child: Scaffold(
              body: Column(
                children: [
                  Container(
                    color: CustomColors.colorPrimary,
                    padding: const EdgeInsets.only(bottom: 1),
                    child: TabBar(
                      tabs: [
                        Tab(text: S.of(context).news,),
                        Tab(text: S.of(context).images,),
                        Tab(text: S.of(context).videos,),
                      ],
                      labelColor: CustomColors.white,
                      indicatorColor: CustomColors.white,
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        NewsView(),
                        Container(),
                        Container(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
