import 'package:get/get.dart';
import 'package:my_grocery/controller/auth_controller.dart';
import 'package:my_grocery/controller/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DashboardController());
    Get.put(AuthController());
  }
}