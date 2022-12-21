import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:osamasmovies/components/custom_colors.dart';
import '../components/i_text.dart';
import '../controller/home_controller.dart';
import '../generated/l10n.dart';
import '../helpers/constants.dart';

class MoreView extends StatelessWidget {
  MoreView({Key? key}) : super(key: key);

  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: CustomColors.colorPrimary,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SafeArea(
                child: Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      margin: const EdgeInsetsDirectional.only(
                        top: 10,
                        bottom: 20,
                        start: 10,
                      ),
                      child: Image.asset(Constants.getDefaultImage),
                    ),
                    const Spacer(),
                    getTextButton(S.of(context).changeToEnglish, () {
                      Constants.changeLocal();
                    }, width: null),
                  ],
                ),
              ),
              getTextButton(S.of(context).clubsGuid, () {}),
              getTextButton(S.of(context).stadiumsGuid, () {}),
              getTextButton(S.of(context).aboutUs, () {}),
              getTextButton(S.of(context).rulesAndRegulations, () {}),
              getTextButton(S.of(context).committees, () {}),
              getTextButton(S.of(context).contactUs, () {}),
              getTextButton(S.of(context).shareApp, () {}),
              getTextButton(S.of(context).subscribeToNewsletter, () {}),
            ],
          ),
          PositionedDirectional(
            bottom: 0,
            end: 27,
            child: Column(
              children: [
                getSocialMediaImage('facebook.png', () {}),
                getSocialMediaImage('twitter.png', () {}),
                getSocialMediaImage('facebook.png', () {}),
                getSocialMediaImage('linkedin.png', () {}),
                getSocialMediaImage('snapchat.png', () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget getTextButton(String title, VoidCallback onPressed, {double? width = double.infinity}) => SizedBox(
        width: width,
        child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            foregroundColor: CustomColors.white,
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            alignment: AlignmentDirectional.centerStart,
          ),
          child: IText(
            title,
            fontSize: 18,
            color: CustomColors.gray3,
          ),
        ),
      );

  Widget getSocialMediaImage(String imagePath, VoidCallback onPressed) =>
      InkWell(
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10,),
          child: Image.asset('assets/images/$imagePath',height: 25, width: 25,color: CustomColors.gray3,),
        ),
      );
}
