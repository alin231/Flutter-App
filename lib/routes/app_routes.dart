import 'package:flutter/material.dart';
import '../pun_homepage_screen.dart';
import '../iphone_daily_pun_screen.dart';

// ignore_for_file: must_be_immutable
class AppRoutes {
  static const String punHomepageScreen = '/pun_homepage_screen';
  static const String iphoneDailyPunScreen = '/iphone_daily_pun_screen';

  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> routes = {
    iphoneDailyPunScreen: IphoneDailyPunScreen.builder,
    punHomepageScreen: (context) => IphoneHomeScreen(),
    initialRoute: (context) => IphoneHomeScreen()
  };
}
