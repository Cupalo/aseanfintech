import 'package:dio/dio.dart';
import 'package:aseanfintech/models/product.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class BaseApi {
  static Dio dio = Dio();

  // static var queryparameter = {'api_key': '45a7134d61b082ded030355d36218ca4'};
  static String base = 'https://test-api.afg-indo.com';
  static String baseApi = '$base/api/';
  static String baseApiImage = '$base/storage/product_images/';
  static String products = 'products';
  static String login = 'login';
  static String register = 'register';

  static Future<String?> authRegister(var body) async {
    var api = baseApi + register;
    try {
      var response = await dio.post(
        api,
        data: body,
        // queryParameters: body,
        options: Options(
          // headers: headers,
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );

      if (kDebugMode) {
        print(api);
        print('Status Code : ${response.statusCode}');
      }

      if (kDebugMode) {
        print(response.data);
      }
      if (response.statusCode == 200) {
        var message = response.data['message'];
        return message;
      } else {
        Get.snackbar('Authentication', '${register.capitalizeFirst} Failed');
        return null;
      }
    } on DioError {
      Get.snackbar('Authentication', 'Something went wrong');
      return null;
    } catch (e) {
      Get.snackbar('Authentication', e.toString());
      if (kDebugMode) {
        print(e.toString());
      }
      return null;
    }
  }

  static Future<String?> authLogin(var body) async {
    var api = baseApi + login;
    try {
      var response = await dio.get(
        api,
        queryParameters: body,
        options: Options(
          // headers: headers,
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );

      if (kDebugMode) {
        print(api);
        print('Status Code : ${response.statusCode}');
      }

      if (kDebugMode) {
        print(response.data);
      }
      if (response.statusCode == 200) {
        var message = response.data['message'];
        return message;
      } else {
        Get.snackbar('Authentication', '${login.capitalizeFirst} Failed');
        return null;
      }
    } on DioError {
      Get.snackbar('Authentication', 'Something went wrong');
      return null;
    } catch (e) {
      Get.snackbar('Authentication', e.toString());
      if (kDebugMode) {
        print(e.toString());
      }
      return null;
    }
  }

  static Future<List<Product>?> getList({int page = 1}) async {
    var api = '$baseApi$products?page=$page';
    try {
      var response = await dio.get(api);

      if (kDebugMode) {
        print('Status Code : ${response.statusCode}');
      }

      if (response.statusCode == 200) {
        if (kDebugMode) {
          print(response.data);
        }
        var list = List<Product>.from(
          response.data.map(
            (e) => Product.fromJson(e),
          ),
        ).toList();
        return list;
      } else {
        return null;
      }
    } on DioError {
      Get.snackbar('Get Data', 'Something went wrong');
      return null;
    } catch (e) {
      Get.snackbar('Get Data', e.toString());
      if (kDebugMode) {
        print(e.toString());
      }
      return null;
    }
  }
}
