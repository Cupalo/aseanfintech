import 'package:aseanfintech/controllers.dart/auth_controller.dart';
import 'package:aseanfintech/ui/page/Auth/login.dart';
import 'package:aseanfintech/ui/page/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Root extends StatelessWidget {
  Root({Key? key}) : super(key: key);
  final AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return authController.isLogin.value ? Home() : Login();
  }
}
