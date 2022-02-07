import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrumpoker/modules/auth/register/register-controller.dart';

class Register extends StatelessWidget {
  final RegisterController registerController = Get.put(RegisterController());

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Register', style: TextStyle(color: Color.fromARGB(255, 82, 143, 235), fontSize: 70)),
              Container(
                padding: EdgeInsets.all(50),
                child: Form(
                  key: registerController.registerFormKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: registerController.nameController,
                        decoration: const InputDecoration(hintText: 'Name'),
                        validator: registerController.validator
                      ),
                      TextFormField(
                        controller: registerController.emailController,
                        decoration: const InputDecoration(hintText: 'Email'),
                        validator: registerController.validator
                      ),
                      TextFormField(
                        controller: registerController.passwordController,
                        decoration: const InputDecoration(hintText: 'Password'),
                        obscureText: true,
                        validator: registerController.validator
                      )
                    ],
                  )
                ),
              ),
              ElevatedButton(
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
                onPressed: registerController.register, child: Text('Submit')
              ),
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 14),
                ),
                onPressed: registerController.goTologin,
                child: const Text('Go to login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
