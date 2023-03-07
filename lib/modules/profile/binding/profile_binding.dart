import 'package:food_truck_merchant/modules/profile/controller/profile_controller.dart';
import 'package:get/get.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
   Get.lazyPut(() => ProfileController());
  }
}