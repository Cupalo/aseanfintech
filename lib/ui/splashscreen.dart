import 'package:aseanfintech/controllers.dart/auth_controller.dart';
import 'package:aseanfintech/default/theme.dart';
import 'package:aseanfintech/ui/root.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);
  final authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        authController.checkToken();
        Get.off(Root());
      },
    );
    return Scaffold(
      appBar: BaseTheme.appBar('splash'),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue,
              Colors.white,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.shop_2,
              size: 120,
              shadows: [
                Shadow(
                  offset: Offset(4, 4),
                  blurRadius: 4,
                  color: Colors.white,
                )
              ],
            ),
            Text(
              'AseanFintech',
              style: TextStyle(
                fontSize: 40,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    offset: Offset(4, 4),
                    blurRadius: 4,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
