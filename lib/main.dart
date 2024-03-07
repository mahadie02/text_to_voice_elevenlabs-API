// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t2v/res/routes.dart';
import '../res/app_pages.dart';
import 'res/app_data.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      //theme: AppData().buildLightTheme(),
      theme: AppData().buildDarkTheme(),
      initialRoute: Routes.homePage,
      getPages: AppPages.pages,
    );
  }
}
