import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:food_truck_merchant/modules/login/view/otp_view.dart';
import 'package:food_truck_merchant/modules/login/view/update_restaurant_view.dart';
import 'package:food_truck_merchant/shared/constants/app_constants.dart';
import 'package:get/get.dart';

import '../../../models/account.dart';
import '../../../models/menu.dart';
import '../../../routes/app_routes.dart';

class LoginController extends GetxController {
  TextEditingController phoneController = TextEditingController();
  RxBool isEnabled = RxBool(false);
  RxBool isCreateNewAccount = RxBool(false);
  RxnString errorText = RxnString(null);

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseDatabase _firebaseDatabase = FirebaseDatabase.instance;

  @override
  void onInit() {
    super.onInit();
    phoneController.addListener(() {
      isEnabled.value = phoneController.text.isNotEmpty;
    });
  }

  void onSignUpAccountClicked() {
    isCreateNewAccount.value = true;
    errorText.value = 'Please input phone number';
    if (phoneController.text.isNotEmpty) {
      phoneController.clear();
    }
  }

  void onSignInClicked({required Function(String) onError}) {
    if (isCreateNewAccount.value == true) {
      _sendRequestCreateAccountWithPhone(phoneController.text,
          onError: onError);
    } else {
      _checkAccountExists(onError: onError);
    }
  }

  void _sendRequestCreateAccountWithPhone(String phone,
      {required Function(String) onError}) {
    _firebaseAuth.verifyPhoneNumber(
      phoneNumber: '+84${phone.substring(1)}',
      verificationCompleted: (phoneCredential) {},
      verificationFailed: (e) {
        onError(e.message ?? 'Error');
      },
      codeSent: (verificationId, resendToken) {
        Get.to(OTPView(
          onVerify: (otpCode) {
            // Create a PhoneAuthCredential with the code
            PhoneAuthCredential credential = PhoneAuthProvider.credential(
                verificationId: verificationId, smsCode: otpCode);
            // Sign the user in (or link) with the credential
            _firebaseAuth.signInWithCredential(credential).then((value) {
              Get.offAllNamed(Routes.auth, arguments: phone);
            });
          },
          onError: () {
            onError('Verify code failed !!!');
          },
        ));
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  void _checkAccountExists({required Function(String) onError}) {
    var dbRef = _firebaseDatabase.refFromURL(AppConstants.URL_DATABASE);
    dbRef
        .child('accounts')
        .child('merchants')
        .child(phoneController.text)
        .get()
        .then((snapshot) async {
      if (snapshot.exists) {
        var account = Account.fromJson(
            jsonDecode(jsonEncode(snapshot.value)) as Map<String, dynamic>);
        if (account.isFirstLogin) {
          final result = await Get.to<int>(const UpdateRestaurantView());
          if (result != null) {
            _updateRestaurantInfo(account.idRes, []);
          }
        } else {
          Get.offAllNamed(Routes.home);
        }
      } else {
        onError('Phone number is not found');
      }
    });
  }

  void _updateRestaurantInfo(String idRes, List<Menu> value) {
    var dbRef = _firebaseDatabase.refFromURL(AppConstants.URL_DATABASE);
    dbRef.child('restaurants').child(idRes).update({'menuOrders': value});
  }
}
