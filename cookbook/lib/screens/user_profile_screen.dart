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
                    height: 120.0,
                    width: MediaQuery.of(context).size.width,
                    child: new Image.asset(
                      'assets/images/logo-white.png',
                      height: 60.0,
                    ),
                  ),
                ],
              ),
              UserProfileButton(
                text: 'Stillingar',
                routeName: '',
                icon: Icons.person,
              ),
              UserProfileButton(
                  text: 'Kredit kort', routeName: '', icon: Icons.credit_card),
              UserProfileButton(
                  text: 'Pantanir',
                  routeName: OrderScreen.routeName,
                  icon: Icons.restore),
              UserProfileButton(
                text: 'Um Vesturbæjarís',
                routeName: '',
                icon: Icons.store,
              ),
              UserProfileButton(
                  text: 'FAQ', routeName: '', icon: Icons.question_answer),
              UserProfileButton(
                  text: 'Skrá út', routeName: '', icon: Icons.lock),
            ],
          )),
      bottomNavigationBar: MenuBar(),
    );
  }
}
