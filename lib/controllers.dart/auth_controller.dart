import 'package:aseanfintech/api/base_api.dart';
import 'package:aseanfintech/ui/page/auth/login.dart';
import 'package:aseanfintech/ui/page/home.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  GetStorage storage = GetStorage();
  var isLogin = false.obs;

  var authState = 'login'.obs;

  var name = ''.obs;
  var email = ''.obs;
  var password = ''.obs;
  var userToken = ''.obs;
  var isRemember = false.obs;
  var isObsecure = true.obs;

  void checkToken() {
    if (storage.read('token') != null) {
      userToken.value = storage.read('token');
      isLogin.value = true;
    } else {
      isLogin.value = false;
    }
  }

  void pressLogin() {
    if (Get.focusScope != null) {
      if (Get.focusScope!.hasPrimaryFocus) {
        Get.focusScope!.unfocus();
      }
    }
    if (kDebugMode) {
      print(email.value);
      print(password.value);
    }
    if (authState.value == 'login') {
      if (email.isNotEmpty && password.isNotEmpty) {
        authLogin(
          email: email.value,
          password: password.value,
        );
      }
    } else {
      if (name.isNotEmpty && email.isNotEmpty && password.isNotEmpty) {
        authRegister(
          name: name.value,
          email: email.value,
          password: password.value,
        );
      }
    }
  }

  changeRemember(value) {
    isRemember.value = value!;
    if (kDebugMode) {
      print('isRemember $value');
    }
  }

  Future<void> authLogin({
    required String email,
    required String password,
  }) async {
    var body = {
      'email': email,
      'password': password,
    };
    var response = await BaseApi.authLogin(body);

    if (response != null) {
      isLogin.value = true;
      storage.write('token', response);
      userToken.value = response;
      Get.offAll(Home());
    }
  }

  Future<void> authRegister({
    required String name,
    required String email,
    required String password,
  }) async {
    var body = {
      'name': name,
      'email': email,
      'password': password,
    };
    var response = await BaseApi.authRegister(body);

    if (response != null) {
      if (response == 'success') {
        authState.value = 'login';
      } else if (response == 'User already exist') {
        Get.snackbar(authState.value.capitalizeFirst!, response);
      } else {
        Get.snackbar(authState.value.capitalizeFirst!, response);
      }
      // isLogin.value = true;
      // storage.write('token', response);
      // userToken.value = response;
      // Get.offAll(Home());

    }
  }

  Future<void> logout() async {
    isLogin.value = false;
    storage.remove('token');
    userToken.value = '';
    authState.value = 'login';
    Get.offAll(Login());
  }
}
