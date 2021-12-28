import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ThemeController extends GetxController {
  late bool isDarkTheme;
  late bool themeHiveSetting;

  // HiveBox for storing the theme setting
  final Box<dynamic> settingsHiveBox = Hive.box('settings');

  //! Getting Theme Stage From HiveBox and Set it to the ThemeMode this will be used in main.dart file
  ThemeMode get themeStateFromHiveSettingBox =>
      _getThemeFromHiveBox() ? ThemeMode.dark : ThemeMode.light;

  @override
  void onInit() {
    //! Getting the Theme State from the Hive Box and save it to the variable
    isDarkTheme = _getThemeFromHiveBox();
    super.onInit();
  }

  // private Method to Get HiveBox Storage theme Setting value adn Return it
  bool _getThemeFromHiveBox() {
    themeHiveSetting =
        settingsHiveBox.get('isDarkMode', defaultValue: Get.isDarkMode);
    print(themeHiveSetting);
    return themeHiveSetting;
  }

  // private Method to update HiveBox Storage theme Setting value
  void _updateHiveThemeSetting(bool boolData) {
    settingsHiveBox.put('isDarkMode', boolData);
  }

  // Method to change the Theme State when the user call it via Theme Chaneg Button
  void changeTheme({
    required RxBool isDarkMode,
    required Rx<String> modeName,
  }) {
    if (Get.isDarkMode) {
      modeName.value = 'light';
      isDarkMode.value = false;
      isDarkTheme = false;
      _updateHiveThemeSetting(false);
      _changeThemeMode(ThemeMode.light);
    } else {
      modeName.value = 'dark';
      isDarkMode.value = true;
      isDarkTheme = true;
      _updateHiveThemeSetting(true);
      _changeThemeMode(ThemeMode.dark);
    }
  }

  //Private Method to change theme
  void _changeThemeMode(ThemeMode themeMode) => Get.changeThemeMode(themeMode);
}
