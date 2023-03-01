import 'package:get/get.dart';
import 'package:Freedom/controller/auth_controller.dart';
import 'package:Freedom/controller/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DashboardController());
    Get.put(AuthController());
  }
}