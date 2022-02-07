import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final registerFormKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  bool emailVerificationError = false;
  User user;

  @override
  void onInit() {
    // Simulating obtaining the user name from some local storage
    super.onInit();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  String validator(String value) {
    if (value.isEmpty) {
      return 'Please this field must be filled';
    }

    return null;
  }

  goTologin() {
    Get.offNamed('/login');
  }

  void register() {
    if (registerFormKey.currentState.validate()) {
      firebaseAuth.createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text).then((response) {
        firebaseAuth.currentUser.sendEmailVerification();

        user = response.user;
        Get.offNamed('/login');
        Get.snackbar('Confirm email', 'Check your email to confirm account');
      });
      // checkUser(emailController.text, passwordController.text).then((auth) {
      //   if (auth) {
      //     Get.snackbar('Login', 'Login successfully');
      //   } else {
      //     Get.snackbar('Login', 'Invalid email or password');
      //   }
      //   passwordController.clear();
      // });
    }
  }
}
