import 'package:flutter/material.dart';
import 'package:food_truck_merchant/models/food.dart';
import 'package:food_truck_merchant/shared/utils/text_formatter.dart';

class ItemFood extends StatelessWidget {
  final Food food;
  final Function(Food) onDelete;
  final Function(Food) onEdit;

  const ItemFood({
    Key? key,
    required this.food,
    required this.onDelete,
    required this.onEdit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 80.0,
              height: 80.0,
              color: Colors.green,
            ),
            const SizedBox(width: 8.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    food.name,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    TextFormatter.formatPrice(food.price()),
                    style: const TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    food.description ?? '',
                    style: const TextStyle(
                      fontSize: 12.0,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
                onPressed: () {
                  onEdit(food);
                },
                icon: const Icon(
                  Icons.edit,
                  color: Colors.grey,
                )),
            IconButton(
                onPressed: () {
                  onDelete(food);
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.grey,
                )),
          ],
        ),
      ),
    );
  }
}
