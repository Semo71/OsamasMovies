import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_utils/src/platform/platform.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_language_fonts/google_language_fonts.dart';
import 'package:osamasmovies/views/main_navigation_view.dart';

import 'components/custom_colors.dart';
import 'generated/l10n.dart';
import 'helpers/app_configuration.dart';
import 'helpers/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();
  AppConfiguration.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  ThemeData _buildTheme() {
    var baseTheme = ThemeData(
        primarySwatch: CustomColors.primarySwatch,
        scaffoldBackgroundColor: CustomColors.customGray,
        appBarTheme: AppBarTheme(
            iconTheme: const IconThemeData(color: CustomColors.white),
            backgroundColor: CustomColors.colorPrimary,
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: CustomColors.colorPrimary,
              statusBarIconBrightness: Brightness.light,
              statusBarBrightness: Brightness.dark,
            ),
            elevation: 0,
            titleTextStyle: ArabicFonts.almarai(
              color: CustomColors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )));

    return baseTheme.copyWith(
      textTheme: ArabicFonts.almaraiTextTheme(baseTheme.textTheme),
    );
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: (context2, widget) {
        final MediaQueryData data = MediaQuery.of(context2);
        return MediaQuery(
          data:
          data.copyWith(textScaleFactor: GetPlatform.isAndroid ? 0.8 : 0.9),
          child: widget!,
        );
      },
      theme: _buildTheme(),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: Locale(Constants.local, ''),
      debugShowCheckedModeBanner: false,
      home: MainNavigationView(),
    );
  }
}
