import 'package:cookbook/models/delivery.dart';
import 'package:cookbook/screens/orders_screen.dart';
import 'package:cookbook/widgets/bars/topbar.dart';
import 'package:cookbook/widgets/items/payment_button.dart';
import 'package:cookbook/widgets/items/user_profile_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cart.dart';

class ConfirmOrderScreen extends StatelessWidget {
  static const routeName = '/confirm-order';
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final deliveryItem = Provider.of<DeliveryItem>(context);
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: TopBar(),
        body: Column(
          children: [
            AppBar(
              title: Text(
                'Staðfesta pöntun',
                style: Theme.of(context).textTheme.caption,
              ),
              centerTitle: true,
              elevation: 0,
              actions: [],
            ),
            Container(
              margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.025,
                  right: MediaQuery.of(context).size.width * 0.025),
              color: Theme.of(context).accentColor,
              height: 1,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              child: Row(
                //crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Til Greiðslu:',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  Text(
                    '${cart.totalAmount.toString()} kr.',
                    style: Theme.of(context).textTheme.headline4,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Afhendingarmáti: ',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  Text(
                    deliveryItem.getDeliveryItem.delivery,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Afhendingarstaður: ',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    height: 100,
                    width: 130,
                    child: Center(
                      child: Text(
                        deliveryItem.getDeliveryItem.adress,
                        style: Theme.of(context).textTheme.headline4,
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.025,
                  right: MediaQuery.of(context).size.width * 0.025),
              color: Theme.of(context).accentColor,
              height: 1,
            ),
            Expanded(
              child: Align(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    UserProfileButton(
                        routeName: null,
                        text: 'Greiða með Korti',
                        icon: Icons.credit_card_outlined,
                        method: null),
                    PaymentButton(
                      routeName: OrderScreen.routeName,
                      text: 'Greiða í verslun',
                      icon: Icons.storefront,
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
