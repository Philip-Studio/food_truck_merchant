import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:food_truck_merchant/modules/profile/controller/profile_controller.dart';
import 'package:get/get.dart';

part 'profile_extension.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1.0,
        titleSpacing: 0.0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
        ),
        title: const Text(
          'Profile',
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(child: buildProfileBody(context)
      ),
    );
  }
}
