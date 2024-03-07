import 'package:get/get.dart';
import 'package:t2v/controllers/homepage_controller.dart';

class HomePageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomePageController());
  }
}
