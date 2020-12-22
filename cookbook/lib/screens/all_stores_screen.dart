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
                    'assets/Icecream_logo.png',
                    height: 60.0,
                  ),
                ),
              ],
            ),
            UserProfileButton(
              text: 'Bæjarlind 201 Kopavogur',
              routeName: ProductOverviewScreen.routeName,
              icon: Icons.location_on_rounded,
              logoutMethod: false,
            ),
            UserProfileButton(
              text: 'Hagamelur 107 Reykjavik',
              routeName: ProductOverviewScreen.routeName,
              icon: Icons.location_on_rounded,
              logoutMethod: false,
            ),
            UserProfileButton(
              text: 'Grensasvegur 108 Reykjavik',
              routeName: ProductOverviewScreen.routeName,
              icon: Icons.location_on_rounded,
              logoutMethod: false,
            ),
            UserProfileButton(
              text: 'Fjardargata 220 Hafnarfjordur',
              routeName: ProductOverviewScreen.routeName,
              icon: Icons.location_on_rounded,
              logoutMethod: false,
            ),
            UserProfileButton(
              text: 'Skipholti 105 Reykjavik',
              routeName: ProductOverviewScreen.routeName,
              icon: Icons.location_on_rounded,
              logoutMethod: false,
            ),
          ],
        ),
      ),
    );
  }
}
