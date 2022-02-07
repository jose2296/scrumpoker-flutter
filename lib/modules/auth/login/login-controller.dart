import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final loginFormKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  FirebaseAuth firevaseAuth = FirebaseAuth.instance;
  RxBool loading = false.obs;
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

  goToRegister() {
    Get.offNamed('/register');
  }

  void login() {
    loading.value = true;
    if (loginFormKey.currentState.validate()) {
      firevaseAuth.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text).then((response) {
        if (!response.user.emailVerified) {
          firevaseAuth.signOut();
          Get.snackbar('Error', 'Your account is not verfied', icon: Icon(Icons.error, color: Colors.white), backgroundColor: Colors.red);
        } else {
          user = response.user;
          Get.offNamed('/rooms');
        }
        loading.value = false;
      }).catchError((error) {
        loading.value = false;
        print(error);
        Get.snackbar('Error', 'The email or password are wrong', icon: Icon(Icons.error, color: Colors.white), backgroundColor: Colors.red);
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
