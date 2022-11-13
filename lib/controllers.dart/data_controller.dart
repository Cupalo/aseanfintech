import 'package:aseanfintech/models/product.dart';
import 'package:get/get.dart';
import 'package:aseanfintech/api/base_api.dart';

class DataController extends GetxController {
  var isLoading = false.obs;
  RxList<Product> listProduct = List<Product>.empty().obs;

  Future<List<Product>?> getData() async {
    isLoading.value = true;
    var response = await BaseApi.getList();

    if (response != null) {
      listProduct.value = response;
      isLoading.value = false;
      return response;
    } else {
      isLoading.value = false;
      return null;
    }
  }
}
