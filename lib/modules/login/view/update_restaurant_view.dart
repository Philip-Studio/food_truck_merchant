import 'package:flutter/material.dart';
import 'package:food_truck_merchant/shared/items/item_food.dart';
import 'package:food_truck_merchant/shared/items/item_menu.dart';
import 'package:food_truck_merchant/shared/utils/show_bottomsheet.dart';
import 'package:food_truck_merchant/shared/utils/show_dialog.dart';
import 'package:get/get.dart';

import '../../../models/food.dart';
import '../../../models/menu.dart';

class UpdateRestaurantView extends StatefulWidget {
  const UpdateRestaurantView({Key? key}) : super(key: key);

  @override
  State<UpdateRestaurantView> createState() => _UpdateRestaurantViewState();
}

class _UpdateRestaurantViewState extends State<UpdateRestaurantView> {
  List<Food> foods = [];
  List<Menu> menuList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 1.0,
        title: const Text(
          'Update Restaurant Info',
          style: TextStyle(fontSize: 16.0, color: Colors.white),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Save'.toUpperCase(),
              style: const TextStyle(fontSize: 16.0, color: Colors.white),
            ),
          ),
          TextButton(
            onPressed: () {
              ShowDialog.showGeneralDialog(
                context,
                message:
                    'All the information you have added will not be saved. Are you sure you want to cancel this action?',
                confirmTitleButton: 'Confirm',
                onCancel: () {
                  Navigator.pop(context);
                },
                onAction: () {
                  Navigator.pop(context);
                  Get.back();
                },
              );
            },
            child: Text(
              'cancel'.toUpperCase(),
              style: const TextStyle(fontSize: 16.0, color: Colors.white),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(height: 8.0),
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
              title: const Text(
                'Restaurant Pictures',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: const Text(
                'Each of our partner stores needs to have a minimum of 8 store photos.',
                style: TextStyle(
                  fontSize: 13.0,
                  color: Colors.black,
                ),
              ),
              trailing: MaterialButton(
                onPressed: () {
                  Navigator.pop(context, 1);
                },
                color: Colors.blue,
                child: const Text(
                  'Select',
                  style: TextStyle(color: Colors.white, fontSize: 16.0),
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            GridView.builder(
              itemCount: 8,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 4.0,
                  crossAxisSpacing: 4.0),
              itemBuilder: (BuildContext context, int index) =>
                  _buildItemPicture(context),
            ),
            const SizedBox(height: 16.0),
            _buildAddMenu(
                context: context,
                onAddFood: (food) {
                  setState(() {
                    foods.add(food);
                  });
                }),
            foods.isNotEmpty
                ? ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => ItemFood(
                          food: foods[index],
                          onDelete: (food) {
                            setState(() {
                              foods.remove(food);
                            });
                          },
                          onEdit: (food) {},
                        ),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 8.0),
                    itemCount: foods.length)
                : const SizedBox(),
            MaterialButton(
              onPressed: () {
                setState(() {
                  menuList.add(Menu(nameMenu: 'Menu title 1', foods: foods));
                  foods.clear();
                });
              },
              minWidth: MediaQuery.of(context).size.width - 8 * 2,
              color: Colors.blue,
              child: const Text(
                'Add Item',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItemPicture(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 4,
      height: 40.0,
      color: Colors.green,
    );
  }

  Widget _buildAddMenu({
    required BuildContext context,
    required Function(Food) onAddFood,
  }) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 4.0),
            title: Text(
              'Add Menu',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              'Please add menu for restaurant to completed process create restaurant. Each store needs to have at least 3 items',
              style: TextStyle(
                fontSize: 13.0,
                color: Colors.black,
              ),
            ),
          ),
          menuList.isNotEmpty
              ? SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      menuList.length,
                      (index) => ItemMenu(menu: menuList[index]),
                    ).toList(),
                  ),
                )
              : const SizedBox(height: 16.0),
          const SizedBox(height: 16.0),
          const TextField(
            decoration: InputDecoration(
              labelText: 'Menu title',
              hintText: 'Enter title in here',
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
            ),
          ),
          const SizedBox(height: 8.0),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Foods (${foods.length} item)',
                  style: const TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    ShowBottomSheet.showBottomSheetAddMenu(
                      context: context,
                      onConfirm: (Food food) {
                        onAddFood(food);
                      },
                    );
                  },
                  color: Colors.blue,
                  child: const Text(
                    'Add',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
