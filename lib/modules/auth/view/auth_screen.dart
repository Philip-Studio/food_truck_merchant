import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:food_truck_merchant/modules/auth/controller/auth_controller.dart';
import 'package:food_truck_merchant/shared/utils/show_dialog.dart';
import 'package:get/get.dart';

part 'auth_extension.dart';

class AuthScreen extends GetView<AuthController> {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(height: 24.0),
                buildCardNote(),
                const SizedBox(height: 24.0),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Input info',
                    style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 24.0),
                Obx(
                  () => buildBaseInputInfo(
                    title: 'Restaurant Owner Information',
                    formInput: _buildFormInputPersonalInfo(
                      onFrontUpload: () {
                        controller.onUploadFrontImage();
                      },
                      onBacksideUpload: () {
                        controller.onUploadBacksideImage();
                      },
                      nameController: controller.nameOwnerController,
                      nationalityController:
                          controller.nameNationalityController,
                      onContinue: () {
                        controller.onButtonContinueClicked(true);
                      },
                    ),
                    controller: controller.ownerExpandableController,
                    icon: Icons.person,
                    checkStatus: controller.isConfirmOwnerResInfo.value
                        ? _buildConfirm()
                        : null,
                  ),
                ),
                const SizedBox(height: 24.0),
                Obx(
                  () => buildBaseInputInfo(
                    title: 'Add Payment Method',
                    formInput: _buildFormInputBankAccountInfo(
                      onAddMethod: () {
                        controller.onAddPayMethodClicked(true);
                      },
                      nameController: controller.paymentMethodController,
                      numberAccountController:
                          controller.numberAccountController,
                    ),
                    controller: controller.bankExpandableController,
                    icon: Icons.payment,
                    checkStatus: controller.isConfirmPaymentMethod.value
                        ? _buildConfirm()
                        : null,
                  ),
                ),
                const SizedBox(height: 24.0),
                buildBaseInputInfo(
                  title: 'Restaurant Information',
                  formInput: _buildRestaurantInfoForm(),
                  controller: controller.restaurantExpandableController,
                  icon: Icons.store,
                ),
              ],
            ),
          ),
        ),
      ),
      persistentFooterButtons: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: MaterialButton(
                onPressed: () {
                  ShowDialog.showGeneralDialog(
                    context,
                    confirmTitleButton: 'Confirm',
                    message:
                        'You will not be able to save information about what you have just done. Are you sure you want to cancel?',
                    onCancel: Get.back,
                    onAction: () {
                      controller.onCancelAuthorized();
                    },
                  );
                },
                color: Colors.grey,
                child: const Text(
                  'Cancel',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12.0),
            Expanded(
              child: MaterialButton(
                onPressed: () {
                  controller.onConfirmButtonClicked();
                },
                color: Colors.blue,
                child: const Text(
                  'Confirm',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
