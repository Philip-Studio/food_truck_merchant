import 'package:flutter/material.dart';
import 'package:food_truck_merchant/models/food.dart';
import 'package:food_truck_merchant/shared/widgets/add_food_widget.dart';

class ShowBottomSheet {
  static Future<void> showBottomSheetAddMenu({
    required BuildContext context,
    required Function(Food food) onConfirm,
  }) async {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topRight: Radius.circular(12.0),
        topLeft: Radius.circular(12.0),
      )),
      builder: (context) => const AddFoodWidget(),
    ).then((value) {
      if(value != null && value is Food) {
        onConfirm(value);
      }
    });
  }
}
