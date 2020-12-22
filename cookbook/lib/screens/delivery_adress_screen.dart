import '../widgets/bars/topbar.dart';
import 'package:flutter/material.dart';
import '../widgets/forms/customform.dart';
import '../screens/ProductOverviewScreen.dart';

class DeliveryAdressScreen extends StatelessWidget {
  static const routeName = '/delivery-adress';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(),
      body: MyCustomForm(
        routeName: ProductOverviewScreen.routeName,
      ),
    );
  }
}
