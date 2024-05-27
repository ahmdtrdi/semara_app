import 'package:get/get.dart';
import 'package:semara_app/routes/routes_name.dart';
import 'package:semara_app/view/onboarding.dart';
import 'package:semara_app/view/registerpage.dart';
import 'package:semara_app/view/splashscreen.dart';

class AppRoutes {
  static const initRoute = RoutesName.splashscreen;
  static final routes = [
    GetPage(
      name: RoutesName.splashscreen,
      page: () => const SplashScreen(),
      transition: Transition.fade,
    ),
    GetPage(
        name: RoutesName.onboarding,
        page: () => const Onboarding(),
        transition: Transition.fade),
    GetPage(name: RoutesName.registerpage, page: () => const Registerpage()),
  ];
}
