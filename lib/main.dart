import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:semara_app/routes/app_routes.dart';

void main() {
  runApp(const SemaraApp());
}

class SemaraApp extends StatelessWidget {
  const SemaraApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.initRoute,
      getPages: AppRoutes.routes,
    );
  }
}
