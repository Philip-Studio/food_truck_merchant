import 'package:get/get.dart';

import '../../../routes/app_routes.dart';

class SplashController extends GetxController {

  void onAnimationEnd() {
    Get.toNamed(Routes.login);
  }
}