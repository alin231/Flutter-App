import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'pun_homepage_screen.dart';
import 'routes/app_routes.dart';
// dfjajd;lfdsjflsd;
var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'iphone_homepage_2',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.routes,
      home: const IphoneHomeScreen(), // Added home screen
    );
  }
}
