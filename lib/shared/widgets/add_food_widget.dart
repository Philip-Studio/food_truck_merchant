import 'package:flutter/material.dart';
import 'package:food_truck_merchant/models/food.dart';

class AddFoodWidget extends StatefulWidget {
  const AddFoodWidget({Key? key}) : super(key: key);

  @override
  State<AddFoodWidget> createState() => _AddFoodWidgetState();
}

class _AddFoodWidgetState extends State<AddFoodWidget> {
  TextEditingController nameFoodController = TextEditingController();
  TextEditingController desFoodController = TextEditingController();
  TextEditingController costFoodController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: nameFoodController,
            decoration: const InputDecoration(
              hintText: 'Enter name food',
            ),
          ),
          TextField(
            controller: desFoodController,
            decoration: const InputDecoration(
              hintText: 'Enter description food',
            ),
          ),
          TextField(
            controller: costFoodController,
            decoration: const InputDecoration(
              hintText: 'Enter price food',
            ),
          ),
          MaterialButton(
            onPressed: () {
              var food = Food(
                name: nameFoodController.text,
                cost: double.tryParse(costFoodController.text) ?? 0.0,
                description: desFoodController.text,
              );
              Navigator.pop(context, food);
            },
            color: Colors.greenAccent,
            child: const Text(
              'Add',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
