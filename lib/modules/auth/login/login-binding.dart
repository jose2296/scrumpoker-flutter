import 'package:get/get.dart';
import 'package:scrumpoker/modules/auth/login/login-controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}
