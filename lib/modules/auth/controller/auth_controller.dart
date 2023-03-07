import 'package:expandable/expandable.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_truck_merchant/models/account.dart';
import 'package:food_truck_merchant/modules/auth/view/authen_status_widget.dart';
import 'package:food_truck_merchant/shared/constants/app_constants.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

import '../../../models/restaurant.dart';
import '../../../routes/app_routes.dart';

class AuthController extends GetxController {
  final phoneNumber = Get.arguments;

  final ImagePicker _picker = ImagePicker();

  RxnString frontImagePath = RxnString(null);
  RxnString backsideImagePath = RxnString(null);
  RxBool isConfirmOwnerResInfo = RxBool(false);
  RxBool isConfirmPaymentMethod = RxBool(false);
  RxBool isConfirmResInfo = RxBool(false);

  TextEditingController nameOwnerController = TextEditingController();
  TextEditingController nameNationalityController = TextEditingController();
  TextEditingController paymentMethodController = TextEditingController();
  TextEditingController numberAccountController = TextEditingController();
  TextEditingController nameResController = TextEditingController();
  TextEditingController serviceTypeController = TextEditingController();

  ExpandableController ownerExpandableController = ExpandableController();
  ExpandableController bankExpandableController = ExpandableController();
  ExpandableController restaurantExpandableController = ExpandableController();

  final _firebaseDatabase = FirebaseDatabase.instance;

  @override
  void onInit() {
    super.onInit();
    ownerExpandableController.expanded = true;
  }

  void onButtonContinueClicked(bool isExpanded) {
    if (nameOwnerController.text.isNotEmpty &&
        nameNationalityController.text.isNotEmpty) {
      ownerExpandableController.expanded = !isExpanded;
      bankExpandableController.expanded = isExpanded;
      isConfirmOwnerResInfo.value = true;
    } else {}
  }

  void onAddPayMethodClicked(bool isExpanded) {
    bankExpandableController.expanded = !isExpanded;
    restaurantExpandableController.expanded = isExpanded;
    isConfirmPaymentMethod.value = true;
  }

  Future<void> onUploadFrontImage() async {
    XFile? frontImage = await _picker.pickImage(source: ImageSource.camera);
    frontImagePath.value = frontImage?.path;
  }

  Future<void> onUploadBacksideImage() async {
    XFile? backsideImage = await _picker.pickImage(source: ImageSource.camera);
    backsideImagePath.value = backsideImage?.path;
  }

  void onConfirmButtonClicked() {
    if (isConfirmOwnerResInfo.isTrue &&
        isConfirmPaymentMethod.isTrue &&
        nameResController.text.isNotEmpty &&
        serviceTypeController.text.isNotEmpty) {
      var uuid = const Uuid();
      String idRes = uuid.v1();
      final dbRef = _firebaseDatabase
          .refFromURL(AppConstants.URL_DATABASE)
          .child('restaurants')
          .child(idRes);
      var restaurant = Restaurant(
        idRestaurant: idRes,
        name: nameResController.text,
        description: 'My description restaurant',
        category: serviceTypeController.text,
        menuOrders: [],
      );
      dbRef
          .set(restaurant.toJson())
          .then((value) => _createMerchantAccount(idRes));
    }
  }

  void _createMerchantAccount(String id) {
    final dbRef = _firebaseDatabase
        .refFromURL(AppConstants.URL_DATABASE)
        .child('accounts')
        .child('merchants')
        .child(phoneNumber);
    var account = Account(
        fullName: nameOwnerController.text,
        phoneNumber: phoneNumber,
        identityType: 1,
        identityNumber: '',
        isFirstLogin: true,
        idRes: id);
    dbRef
        .set(account.toJson())
        .then((value) => Get.to(AuthenticationStatusWidget(
              onBack: () {
                Get.offAllNamed(Routes.login);
              },
            )));
  }

  void onCancelAuthorized() {
    Get.offAllNamed(Routes.login);
  }
}
