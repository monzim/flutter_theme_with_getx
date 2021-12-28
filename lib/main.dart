import 'package:flutter/material.dart';
import 'package:flutter_theme_with_getx/app/modules/initial/bindings/initial_binding.dart';
import 'package:flutter_theme_with_getx/app/theme/controller/theme_controller.dart';
import 'package:flutter_theme_with_getx/app/theme/theme.dart';

import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter(); // Initialize Hive
  await Hive.openBox('settings'); // Open the box that will store the settings

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Createing theme instance For Getting the ThemeMode Stage from the ThemeController
    final ThemeController _themeController = Get.put(ThemeController());

    return GetMaterialApp(
      title: "Flutter Theme",
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      initialBinding:
          InitialBinding(), // Initial Binding to make Sure the ThemeController is initialized
      themeMode: _themeController
          .themeStateFromHiveSettingBox, // Setting the ThemeMode from the Hive Setting Box
      theme: CustomTheme.lightTheme, // CustomThemeData for Light Theme
      darkTheme: CustomTheme.darkTheme, // CustomThemeData for Dark Theme
    );
  }
}
