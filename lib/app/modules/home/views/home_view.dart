// import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Theme'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: controller.animationController,
              builder: (context, child) {
                return Transform.rotate(
                  angle: controller.animationController.value * 1 * pi,
                  child: child,
                );
              },
              child: Icon(
                controller.isDarkMode.value
                    ? Icons.dark_mode
                    : Icons.light_mode,
                size: 100,
              ),
            ),
            SizedBox(
              height: 50,
              child: Center(
                child: AnimatedDefaultTextStyle(
                    curve: Curves.easeInOut,
                    duration: const Duration(milliseconds: 500),
                    style: GoogleFonts.ubuntuMono(
                      fontSize: controller.fontSize,
                      color: controller.textColor,
                      fontWeight: FontWeight.w900,
                    ),
                    child:
                        Text(controller.currentModeName.value.toUpperCase())),
              ),
            ),
            Text(
              'Current theme',
              style: Theme.of(context).textTheme.headline4,
            ),
            SelectableText(
              'github.com/Monzim/flutter_theme_with_getx',
              style: Theme.of(context).textTheme.overline,
            ),
            const SizedBox(height: 20),
            CupertinoSwitch(
              value: controller.isDarkMode.value,
              onChanged: (bool val) {
                controller.toggleTheme();
                Get.snackbar(
                  '',
                  '',
                  maxWidth: 300,
                  titleText: Text(
                    'App Theme Changed',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  messageText: Text(
                    'to ${controller.currentModeName.value.toUpperCase()}',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  snackStyle: SnackStyle.FLOATING,
                  // maxWidth: 150,
                  mainButton: TextButton(
                    style: TextButton.styleFrom(primary: Colors.black),
                    onPressed: () {
                      controller.changeAppTheme();
                      Get.back();
                    },
                    child: Text(
                      'Revert',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.button,
                    ),
                  ),
                  backgroundColor:
                      controller.isDarkMode.value ? Colors.white : Colors.black,
                  snackPosition: SnackPosition.BOTTOM,
                );
              },
            ),
            const SizedBox(height: 2),
            ElevatedButton(
                onPressed: () {
                  controller.changeAppTheme();
                  if (Get.isOverlaysOpen) {
                    Get.back();
                  }
                  Get.snackbar(
                    '',
                    '',
                    maxWidth: 300,
                    titleText: Text(
                      'App Theme Changed',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    messageText: Text(
                      'to ${controller.currentModeName.value.toUpperCase()}',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    snackStyle: SnackStyle.FLOATING,
                    // maxWidth: 150,
                    mainButton: TextButton(
                      style: TextButton.styleFrom(primary: Colors.black),
                      onPressed: () {
                        controller.changeAppTheme();
                        Get.back();
                      },
                      child: Text(
                        'Revert',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.button,
                      ),
                    ),
                    backgroundColor: controller.isDarkMode.value
                        ? Colors.white
                        : Colors.black,
                    snackPosition: SnackPosition.BOTTOM,
                  );
                },
                child: const Text('Change Theme')),
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
