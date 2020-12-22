import 'package:cookbook/screens/auth_screen.dart';

import '../widgets/bars/topbar.dart';
import 'package:flutter/material.dart';
import '../widgets/bars/menubar.dart';
import '../screens/delivery_screen.dart';
import '../widgets/items/user_profile_button.dart';
import '../screens/orders_screen.dart';

class UserProfile extends StatelessWidget {
  static const routeName = '/user-profile';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(),
      body: Container(
          padding: EdgeInsets.all(10),
          color: Theme.of(context).primaryColor,
          child: Column(
            children: [
              Center(
                child: Container(
                  margin: EdgeInsets.all(8),
                  height: 150,
                  width: 200,
                  child: Image.asset('assets/logo-white.png'),
                ),
              ),
              UserProfileButton(
                text: 'Stillingar',
                routeName: '',
                icon: Icons.person,
                logoutMethod: false,
              ),
              UserProfileButton(
                text: 'Pantanir',
                routeName: OrderScreen.routeName,
                icon: Icons.restore,
                logoutMethod: false,
              ),
              UserProfileButton(
                text: 'Skilmálar',
                routeName: OrderScreen.routeName,
                icon: Icons.book,
                logoutMethod: false,
              ),
              UserProfileButton(
                text: 'Um okkur',
                routeName: '',
                icon: Icons.store,
                logoutMethod: false,
              ),
              UserProfileButton(
                text: 'Spurt og svarað',
                routeName: DeliveryScreen.routeName,
                icon: Icons.question_answer,
                logoutMethod: false,
              ),
              UserProfileButton(
                text: 'Skrá út',
                routeName: '/',
                icon: Icons.lock,
                logoutMethod: true,
              ),
            ],
          )),
      bottomNavigationBar: MenuBar(),
    );
  }
}
