import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrumpoker/modules/app/rooms.dart';
import 'package:scrumpoker/modules/auth/login/login-binding.dart';
import 'package:scrumpoker/modules/auth/login/login.dart';
import 'package:scrumpoker/modules/auth/register/register.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/login',
      getPages: [
        GetPage(
          name: '/login',
          page: () => Login(),
          binding: LoginBinding(),
        ),
        GetPage(name: '/register', page: () => Register()),
        GetPage(
          name: '/rooms',
          page: () => Rooms()
        )
      ],
    );
  }
}
