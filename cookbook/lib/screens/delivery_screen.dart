import 'package:cookbook/models/delivery.dart';
import 'package:provider/provider.dart';

import '../widgets/bars/topbar.dart';
import 'package:flutter/material.dart';
import '../screens/all_stores_screen.dart';
import '../screens/delivery_adress_screen.dart';
import '../widgets/items/user_profile_button.dart';

class DeliveryScreen extends StatelessWidget {
  static const routeName = '/delivery';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(),
      body: Container(
        color: Theme.of(context).primaryColor,
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: new Image.asset(
                  'assets/logo-white.png',
                  height: 130.0,
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Column(
                  children: [
                    UserProfileButton(
                      text: 'Sækja',
                      routeName: AllStoresScreen.routeName,
                      icon: Icons.shopping_bag,
                      method: 'delivery',
                    ),
                    UserProfileButton(
                      text: 'Heimsending',
                      routeName: DeliveryAdressScreen.routeName,
                      icon: Icons.delivery_dining,
                      method: null,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
