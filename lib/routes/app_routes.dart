 import 'package:flutter/material.dart';
import '../iphone_daily_pun/iphone_daily_pun_screen.dart';
import '../iphone_14_15_pro_two/iphone_14_15_pro_two_screen.dart';
import '../iphone_flashcards/iphone_flashcards_screen.dart';
import '../iphone_homepage/iphone_home_screen.dart';

class AppRoutes {
  static const String iphoneDailyPunScreen = '/iphone_daily_pun_screen';
  static const String iphoneHomepage = '/iphone_homepage';
  static const String iphoneFlashcardsScreen = '/iphone_flashcards_screen';
  static const String iphone1415ProTwoScreen = '/iphone_14_15_pro_two_screen';
  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> get routes => {
    iphoneDailyPunScreen: IphoneDailyPunScreen.builder,
    iphoneHomepage: IphoneHomeScreen.builder,
    iphoneFlashcardsScreen: IphoneFlashcardsScreen.builder,
    iphone1415ProTwoScreen: Iphone1415ProTwoScreen.builder,
    initialRoute: IphoneHomeScreen.builder,
  };
}