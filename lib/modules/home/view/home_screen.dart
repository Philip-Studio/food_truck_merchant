import 'package:flutter/material.dart';
import 'package:food_truck_merchant/modules/home/controller/home_controller.dart';
import 'package:food_truck_merchant/shared/menu_drawer.dart';
import 'package:food_truck_merchant/shared/utils/show_dialog.dart';
import 'package:get/get.dart';

part 'home_extension.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Home'),
        elevation: 0.0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.add_business_outlined,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: homeBody(),
      drawer: Obx(() => MenuDrawer(
            onLogout: () {
              ShowDialog.showGeneralDialog(
                context,
                message: 'Are you sure you want to sign out of this app ?',
                onCancel: Get.back,
                onAction: () {
                  controller.onLogout();
                },
                confirmTitleButton: 'Confirm',
                cancelTitleButton: 'Cancel',
              );
            },
            onChanged: (value) {
              controller.isOpenStore.value = value;
            },
            isOpenStore: controller.isOpenStore.value,
          )),
    );
  }
}
