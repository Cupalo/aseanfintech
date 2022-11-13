import 'package:aseanfintech/api/base_api.dart';
import 'package:aseanfintech/controllers.dart/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aseanfintech/controllers.dart/data_controller.dart';
import 'package:aseanfintech/default/theme.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  final DataController dataController = Get.put(DataController());
  final AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () => dataController.getData());
    return Obx(() {
      return Scaffold(
        appBar: BaseTheme.appBar('PRODUCTS', actions: [
          IconButton(
            onPressed: () => logoutDialog(),
            icon: const Icon(
              Icons.logout,
              color: Colors.blue,
            ),
          )
        ]),
        body: ListView(
          children: [
            dataController.isLoading.value
                ? SizedBox(
                    height: Get.height,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : dataController.listProduct.isEmpty
                    ? const Center(
                        child: Text('No Data'),
                      )
                    : ListView.builder(
                        padding: BaseTheme.marginVertical,
                        shrinkWrap: true,
                        primary: false,
                        itemCount: dataController.listProduct.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {},
                            child: ListTile(
                              contentPadding: BaseTheme.marginAll,
                              leading: CircleAvatar(
                                radius: 30,
                                foregroundImage: NetworkImage(
                                  BaseApi.baseApiImage +
                                      (dataController
                                              .listProduct[index].image ??
                                          ''),
                                ),
                                onForegroundImageError:
                                    (exception, stackTrace) {
                                  throw exception;
                                },
                                child: Text(
                                  dataController.listProduct[index].date == null
                                      ? ''
                                      : dataController.listProduct[index].name!
                                          .substring(0, 1),
                                ),
                              ),
                              title: Text(
                                '${(dataController.listProduct[index].name ?? '')} ',
                              ),
                              subtitle: Text(
                                BaseTheme.dateFormat(
                                  dataController.listProduct[index].date ?? '',
                                ),
                              ),
                              trailing: Text(
                                BaseTheme.currencyFormatter(
                                  dataController.listProduct[index].price ?? '',
                                ),
                              ),
                            ),
                          );
                        },
                      ),
          ],
        ),
      );
    });
  }

  logoutDialog() {
    Get.defaultDialog(
      title: 'Logout',
      middleText: 'Are you sure ?',
      onConfirm: () {
        authController.logout();
      },
      textCancel: 'Cancel',
    );
  }
}
