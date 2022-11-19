import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:halloween_official/screens/homepage.dart';
import 'package:device_preview/device_preview.dart';
import 'package:halloween_official/screens/screen_page.dart';
import 'package:get/get.dart';
import 'controller/cart_controller.dart';

void main() => runApp(
      DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => MyApp(), // Wrap your app
      ),
    );

class MyApp extends StatelessWidget {
  MyApp({super.key});
  CartController cartController = Get.put(CartController());

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: AppScrollBehavior(),
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      home: const ScreenPage(),
    );
  }
}
