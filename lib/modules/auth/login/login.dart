import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrumpoker/modules/auth/login/login-controller.dart';

class Login extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Login', style: TextStyle(color: Color.fromARGB(255, 82, 143, 235), fontSize: 70)),
              Container(
                padding: EdgeInsets.all(50),
                child: Form(
                  key: loginController.loginFormKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: loginController.emailController,
                        decoration: const InputDecoration(hintText: 'Email'),
                        validator: loginController.validator
                      ),
                      TextFormField(
                        controller: loginController.passwordController,
                        decoration: const InputDecoration(hintText: 'Password'),
                        obscureText: true,
                        validator: loginController.validator
                      )
                    ],
                  )
                ),
              ),
              ElevatedButton.icon(
                icon: Obx(() => loginController.loading.value ? SizedBox(child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2), width: 10, height: 10) : Container(color: Colors.transparent)),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                      side: BorderSide(color: Colors.black, width: 5),
                    )
                  ),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 50, vertical: 15))
                ),
                onPressed: loginController.login, label: Text('Submit')
              ),
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 14),
                ),
                onPressed: loginController.goToRegister,
                child: const Text('Dont have an account?'),
              ),
            ],
          ),
        )
      )
    );
  }
}
