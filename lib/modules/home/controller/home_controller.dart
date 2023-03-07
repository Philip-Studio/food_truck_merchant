import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

import '../../../routes/app_routes.dart';

class HomeController extends GetxController {

  RxBool isOpenStore = RxBool(false);
  final _firebaseAuth = FirebaseAuth.instance;
  final _firebaseDatabase = FirebaseDatabase.instance;



  void onLogout() {
    _firebaseAuth.signOut().then((value) {
      Get.offAllNamed(Routes.login);
    });
  }
}
