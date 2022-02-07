import 'package:get/get.dart';
import 'package:scrumpoker/modules/auth/register/register-controller.dart';

class RegisterBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterController());
  }
}
