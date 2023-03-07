import 'package:flutter/material.dart';
import 'package:food_truck_merchant/modules/create_restaurant/controller/create_restaurant_controller.dart';
import 'package:get/get.dart';

part 'create_restaurant_extension.dart';

class CreateRestaurantScreen extends GetView<CreateRestaurantController> {
  const CreateRestaurantScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        title: const Text(
          'Create merchant',
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.white,
          ),
        ),
      ),
      body: createRestaurantBody(),
    );
  }
}
