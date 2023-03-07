import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  //final merchantResult = Get.arguments as Merchant;
  final ImagePicker _picker = ImagePicker();

  FirebaseDatabase firebaseDatabase = FirebaseDatabase.instance;

  RxnString frontImagePath = RxnString(null);
  RxnString backsideImagePath = RxnString(null);
  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    // fullNameController.text = merchantResult.fullName;
    // phoneController.text = merchantResult.phoneNumber;
  }

  Future<void> onUploadFrontImage() async {
    XFile? frontImage = await _picker.pickImage(source: ImageSource.camera);
    frontImagePath.value = frontImage?.path;
  }

  Future<void> onUploadBacksideImage() async {
    XFile? backsideImage = await _picker.pickImage(source: ImageSource.camera);
    backsideImagePath.value = backsideImage?.path;
  }

  Future<void> updateProfile() async {
    var dbRef = firebaseDatabase
        .refFromURL("https://foodtruck-d8f65-default-rtdb.firebaseio.com/")
        .child('accounts')
        .child('merchants');
  }
}
