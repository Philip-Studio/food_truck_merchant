import 'package:food_truck_merchant/modules/create_restaurant/controller/create_restaurant_controller.dart';
import 'package:get/get.dart';

class CreateRestaurantBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateRestaurantController());
  }
}