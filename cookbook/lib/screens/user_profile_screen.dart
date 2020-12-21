import 'package:cookbook/screens/auth_screen.dart';

import '../widgets/bars/topbar.dart';
import 'package:flutter/material.dart';
import '../widgets/bars/menubar.dart';

import '../widgets/items/user_profile_button.dart';
import '../screens/orders_screen.dart';

class UserProfile extends StatelessWidget {
  static const routeName = '/user-profile';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(),
      body: Container(
          color: Theme.of(context).primaryColor,
          child: Column(
            children: [
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
                routeName: '',
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
