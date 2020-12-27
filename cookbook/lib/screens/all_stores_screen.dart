import '../widgets/bars/topbar.dart';
import 'package:flutter/material.dart';
import '../widgets/bars/back_appbar.dart';
import '../widgets/items/user_profile_button.dart';

import '../screens/ProductOverviewScreen.dart';

class AllStoresScreen extends StatelessWidget {
  static const routeName = '/all-stores';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(),
      body: Container(
        color: Theme.of(context).primaryColor,
        child: Column(
          children: [
            BackAppBar("Veldu hvar þú vilt sækja"),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 15, bottom: 25),
                  height: 150.0,
                  width: MediaQuery.of(context).size.width,
                  child: new Image.asset(
                    'assets/logo-white.png',
                    height: 60.0,
                  ),
                ),
              ],
            ),
            UserProfileButton(
              text: 'Bæjarlind 201 Kópavogur',
              routeName: ProductOverviewScreen.routeName,
              icon: Icons.location_on_rounded,
              method: 'store',
            ),
            UserProfileButton(
              text: 'Hagamelur 107 Reykjavík',
              routeName: ProductOverviewScreen.routeName,
              icon: Icons.location_on_rounded,
              method: 'store',
            ),
            UserProfileButton(
              text: 'Grensásvegur 108 Reykjavík',
              routeName: ProductOverviewScreen.routeName,
              icon: Icons.location_on_rounded,
              method: 'store',
            ),
            UserProfileButton(
              text: 'Fjarðargata 220 Hafnarfjorður',
              routeName: ProductOverviewScreen.routeName,
              icon: Icons.location_on_rounded,
              method: 'store',
            ),
            UserProfileButton(
              text: 'Skipholti 105 Reykjavik',
              routeName: ProductOverviewScreen.routeName,
              icon: Icons.location_on_rounded,
              method: 'store',
            ),
          ],
        ),
      ),
    );
  }
}
