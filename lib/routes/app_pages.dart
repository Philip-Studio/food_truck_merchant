import 'package:food_truck_merchant/modules/auth/binding/auth_binding.dart';
import 'package:food_truck_merchant/modules/auth/view/auth_screen.dart';
import 'package:food_truck_merchant/modules/create_restaurant/binding/create_restaurant_binding.dart';
import 'package:food_truck_merchant/modules/home/binding/home_binding.dart';
import 'package:food_truck_merchant/modules/login/binding/login_binding.dart';
import 'package:food_truck_merchant/modules/profile/binding/profile_binding.dart';
import 'package:food_truck_merchant/modules/splash/binding/splash_binding.dart';
import 'package:food_truck_merchant/modules/create_restaurant/view/create_restaurant_screen.dart';
import 'package:food_truck_merchant/modules/home/view/home_screen.dart';
import 'package:food_truck_merchant/modules/login/view/login_screen.dart';
import 'package:food_truck_merchant/modules/profile/view/profile_screen.dart';
import 'package:food_truck_merchant/modules/splash/view/splash_screen.dart';
import 'package:get/get.dart';

import 'app_routes.dart';

final pages = [
  GetPage(
    name: Routes.splash,
    page: () => const SplashScreen(),
    binding: SplashBinding(),
  ),
  GetPage(
    name: Routes.login,
    page: () => const LoginScreen(),
    binding: LoginBinding(),
  ),
  GetPage(
    name: Routes.home,
    page: () => const HomeScreen(),
    binding: HomeBinding(),
  ),
  GetPage(
    name: Routes.profile,
    page: () => const ProfileScreen(),
    binding: ProfileBinding(),
  ),
  GetPage(
    name: Routes.auth,
    page: () => const AuthScreen(),
    binding: AuthBinding(),
  ),
  GetPage(
    name: Routes.createRestaurant,
    page: () => const CreateRestaurantScreen(),
    binding: CreateRestaurantBinding(),
  ),
];
