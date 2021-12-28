import 'package:flutter/material.dart';
import 'package:flutter_theme_with_getx/app/theme/controller/theme_controller.dart';
import 'package:get/get.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final ThemeController _themeController = Get.find<ThemeController>();

  Rx<String> currentModeName = ''.obs;

  RxBool isDarkMode = false.obs; // Current Theme Stage

  //! Not Related To Theme> Just for Animation
  late Color textColor;
  double fontSize = 20;
  late AnimationController animationController;
  //! <Not Related To Theme Just for Animation

  @override
  void onInit() {
    //Getting theme Stage from ThemeController when homeView initialized
    isDarkMode.value = _themeController.isDarkTheme;
    currentModeName.value = _themeController.isDarkTheme ? 'Dark' : 'Light';

    //! Not Related To Theme > Just for Animation
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 430));
    animationController.reset();
    textColor = isDarkMode.value ? Colors.white : Colors.red;
    fontSize = isDarkMode.value ? 30 : 20;
    //! <Not Related To Theme Just for Animation

    super.onInit();
  }

  // Change Theme  Method That will call From HomeView
  void changeAppTheme() => _changeTheme();

  // Toggleing the Theme
  bool toggleTheme() {
    _changeTheme();
    return isDarkMode.value;
  }

  // Changeing Vale for Animation
  void _animate() {
    if (isDarkMode.value) {
      fontSize = 30;
      textColor = Colors.white;
      animationController.reverse();
    } else {
      fontSize = 20;
      textColor = Colors.red;
      animationController.forward();
    }
  }

  // Calling the changeTheme Method from ThemeController
  void _changeTheme() {
    _themeController.changeTheme(
      isDarkMode: isDarkMode,
      modeName: currentModeName,
    );
    _animate();
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
