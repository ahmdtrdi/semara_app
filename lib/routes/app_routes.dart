import 'package:get/get.dart';
import 'package:semara_app/routes/routes_name.dart';

import '../view/onboarding.dart';

class AppRoutes {
  static const initRoute = RoutesName.onboarding;
  static final routes = [
    GetPage(
      name: RoutesName.onboarding,
      page: () => const Onboarding(),
    ),
  ];
}
