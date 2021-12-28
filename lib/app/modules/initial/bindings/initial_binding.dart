import 'package:flutter_theme_with_getx/app/theme/controller/theme_controller.dart';
import 'package:get/get.dart';

import '../controllers/initial_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ThemeController>(() => ThemeController());
    Get.lazyPut<InitialController>(() => InitialController());
  }
}
