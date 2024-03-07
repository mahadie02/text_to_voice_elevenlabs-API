import 'package:get/get.dart';
import '../bindings/homepage_bindings.dart';
import '../view/home_page.dart';
import 'routes.dart';

abstract class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: Routes.homePage,
      binding: HomePageBindings(),
      page: () => const HomePage(),
    ),
  ];
}
