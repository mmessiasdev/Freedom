import 'package:fluttercode/controller/routes/route.dart';
import 'package:fluttercode/view/pages/login/login.dart';
import 'package:get/get.dart';

import '../../view/pages/adm/dashboard.dart';

class AppPage {
  static var list = [
    GetPage(
      name: AppRoute.dashboard,
      page: () => const Login(),
      binding: DashboardBinding(),
    ),
  ];
}
