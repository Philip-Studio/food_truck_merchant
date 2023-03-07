import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:food_truck_merchant/modules/splash/controller/splash_controller.dart';
import 'package:get/get.dart';

part 'splash_extension.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: splashBody(context),
    );
  }
}
