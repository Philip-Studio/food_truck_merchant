import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_truck_merchant/routes/app_pages.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Food Truck Merchant',
      theme: ThemeData(primarySwatch: Colors.blue),
      getPages: pages,
    );
  }
}
