import 'package:flutter/material.dart';
import '../iphone_home_screen.dart';
import '../iphone_daily_pun_screen.dart';

// ignore_for_file: must_be_immutable
class AppRoutes {
  static const String iphoneHomeScreen = '/iphone_home_screen';
  static const String iphoneDailyPunScreen = '/iphone_daily_pun_screen';

  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> routes = {
    iphoneDailyPunScreen: IphoneDailyPunScreen.builder,
    iphoneHomeScreen: (context) => IphoneHomeScreen(),
    initialRoute: (context) => IphoneHomeScreen()
  };
}
