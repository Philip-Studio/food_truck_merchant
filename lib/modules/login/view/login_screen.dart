import 'package:flutter/material.dart';
import 'package:food_truck_merchant/modules/login/controller/login_controller.dart';
import 'package:get/get.dart';

import '../../../routes/app_routes.dart';

part 'login_extension.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top:48.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(
                    Icons.store_mall_directory_outlined,
                    color: Colors.blue,
                    size: 56.0,
                  ),
                  Text(
                    'Food Truck\nMerchant',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            loginBody(context),
            buildFooter(),
          ],
        ),
      )
    );
  }
}
