import 'package:flutter/material.dart';
import 'package:food_truck_merchant/routes/app_routes.dart';
import 'package:get/get.dart';

class MenuDrawer extends StatelessWidget {
  final bool isOpenStore;
  final Function() onLogout;
  final Function(bool value) onChanged;

  const MenuDrawer({
    Key? key,
    required this.onLogout,
    required this.onChanged,
    required this.isOpenStore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            Container(
              color: Colors.blue,
              child: Stack(
                children: [
                  Container(
                    width: Get.width,
                    height: 200.0,
                    foregroundDecoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                    ),
                  ),
                  Positioned(
                    bottom: 8.0,
                    left: 8.0,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 48.0,
                          height: 48.0,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 12.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Text(
                              'Cua hang ABC',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 4.0),
                            Text(
                              'abc.merchant@giangho.vn',
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 8.0,
                    right: 8.0,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          isOpenStore ? 'Đang mở cửa' : 'Đã đóng cửa',
                          style: const TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 12.0),
                        Switch(
                          value: isOpenStore,
                          onChanged: onChanged,
                          activeColor: Colors.amberAccent,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.account_circle),
              title: const Text('Profile'),
              onTap: () {
                Get.toNamed(Routes.profile);
              },
            ),
            const ListTile(
              leading: Icon(Icons.shopping_bag_outlined),
              title: Text('Order Status'),
            ),
            const ListTile(
              leading: Icon(Icons.history),
              title: Text('History'),
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                onLogout();
              },
            ),
            const Divider(color: Colors.black54),
            const ListTile(
              leading: Icon(Icons.security_rounded),
              title: Text('Terms of Service'),
            ),
            const ListTile(
              leading: Icon(Icons.help_outline),
              title: Text('Help Center'),
            ),
          ],
        ),
      ),
    );
  }
}
