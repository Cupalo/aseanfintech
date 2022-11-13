import 'package:aseanfintech/api/base_api.dart';
import 'package:aseanfintech/controllers.dart/auth_controller.dart';
import 'package:aseanfintech/default/theme.dart';
import 'package:aseanfintech/ui/widget/base/form.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  final AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Obx(() {
        return Column(
          children: [
            Container(
              height: Get.height * 0.8,
              padding: BaseTheme.marginRectangularLarge,
              child: Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(),
                  ),
                  Text(
                    authController.authState.value.capitalizeFirst!,
                    style: const TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  const Text(
                    'By signing in you are agreeing our',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: const Text('Term and privasy policy'),
                  ),

                  Expanded(child: Container()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      authState('login'),
                      const SizedBox(width: 10),
                      authState('register')
                    ],
                  ),
                  Expanded(child: Container()),
                  authController.authState.value == BaseApi.login
                      ? Container()
                      : FormWidget(
                          prefixIcon: const Icon(Icons.person_outline),
                          hint: 'Name',
                          rxString: authController.name,
                        ),
                  Expanded(child: Container()),
                  FormWidget(
                    prefixIcon: const Icon(Icons.email_outlined),
                    hint: 'Email',
                    rxString: authController.email,
                  ),
                  Expanded(child: Container()),
                  FormWidget(
                    prefixIcon: const Icon(Icons.lock_outline),
                    hint: 'Password',
                    rxString: authController.password,
                    obsecure: authController.isObsecure.value,
                    suffixIcon: IconButton(
                      onPressed: () {
                        authController.isObsecure.value =
                            !authController.isObsecure.value;
                      },
                      icon: Icon(
                        authController.isObsecure.isTrue
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    ),
                  ),
                  Expanded(child: Container()),
                  Row(
                    children: [
                      Checkbox(
                        value: authController.isRemember.value,
                        onChanged: authController.changeRemember,
                      ),
                      Expanded(
                        child: Text(
                          'Remember password',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: Get.width * 0.03,
                          ),
                        ),
                      ),
                      Text(
                        'Forgot password',
                        style: TextStyle(
                          fontSize: Get.width * 0.03,
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox(width: Get.width * 0.04),
                    ],
                  ),
                  Expanded(child: Container()),
                  ElevatedButton(
                    onPressed: authController.pressLogin,
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(
                        Get.width,
                        Get.height * 0.05,
                      ),
                    ),
                    child: Text(
                      authController.authState.value.capitalizeFirst!,
                    ),
                  ),
                  Expanded(child: Container()),
                  const Text('or connect with'),
                  Expanded(child: Container()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      sosmedLogo('assets/facebook.png'),
                      Container(
                        height: 32,
                        width: 32,
                        margin: BaseTheme.marginRectangularSmall,
                        padding: BaseTheme.marginAll,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.blue[800],
                        ),
                        child: Image.asset(
                          'assets/instagram.png',
                          color: Colors.white,
                          fit: BoxFit.cover,
                        ),
                      ),
                      sosmedLogo('assets/pinterest.png'),
                      sosmedLogo('assets/linkedin.png'),
                    ],
                  ),

                  // Expanded(child: Container()),
                ],
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  Container(
                    height: Get.height * 0.2,
                    width: Get.width,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.blue,
                          Colors.transparent,
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                  ),
                  Container(
                    height: Get.height * 0.11,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.elliptical(160, 40),
                        bottomRight: Radius.elliptical(160, 40),
                      ),
                      color: Colors.white,
                    ),
                  ),
                  Column(
                    children: [
                      Expanded(child: Container()),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          border: Border.all(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          Icons.fingerprint,
                          size: 60,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: Get.height * 0.01),
                      const Text(
                        'Login with touch ID',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: Get.height * 0.02)
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }

  Widget sosmedLogo(String url) {
    return Image.asset(
      url,
      frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
        return Container(
          margin: BaseTheme.marginRectangularSmall,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 16,
            child: child,
          ),
        );
      },
    );
  }

  Widget authState(
    String state,
  ) {
    return GestureDetector(
      onTap: () {
        authController.authState.value = state;
      },
      child: Container(
        padding: const EdgeInsets.only(bottom: 4),
        decoration: BoxDecoration(
          border: Border(
            bottom: authController.authState.value == state
                ? const BorderSide(color: Colors.black)
                : BorderSide.none,
          ),
        ),
        child: Text(
          state.capitalizeFirst!,
          style: TextStyle(
            color: authController.authState.value == state
                ? Colors.blue
                : Colors.grey,
          ),
        ),
      ),
    );
  }

  void executeAuth() {
    if (Get.focusScope != null) {
      if (Get.focusScope!.hasPrimaryFocus) {
        Get.focusScope!.unfocus();
      }
    }
    if (kDebugMode) {
      print(authController.email.value);
      print(authController.password.value);
    }
    if (authController.email.isNotEmpty && authController.password.isNotEmpty) {
      authController.authLogin(
        email: authController.email.value,
        password: authController.password.value,
      );
    }
  }

  void changeState() {
    if (authController.authState.value == BaseApi.login) {
      authController.authState.value = BaseApi.register;
    } else {
      authController.authState.value = BaseApi.login;
    }
    if (kDebugMode) {
      print(authController.authState.value);
    }
  }

  Widget text(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 60,
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.bold,
        shadows: [
          Shadow(
            offset: Offset(4, 4),
            blurRadius: 4,
            color: Colors.blue,
          )
        ],
      ),
    );
  }
}
