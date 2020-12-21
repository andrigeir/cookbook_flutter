import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/cart.dart';
import '../../models/orders.dart';

class PaymentButton extends StatelessWidget {
  const PaymentButton({
    Key key,
    @required this.routeName,
    @required this.text,
    @required this.icon,
  }) : super(key: key);

  final String routeName;
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return InkWell(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 50.0,
            child: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Icon(icon, color: Theme.of(context).accentColor),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(text,
                      style: Theme.of(context)
                          .textTheme
                          .button
                          .apply(color: Colors.white)),
                ),
              ),
              IconButton(
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Theme.of(context).accentColor,
                  ),
                  onPressed: () {})
            ]),
            decoration: BoxDecoration(
                border: new Border.all(
                    width: 1, color: Theme.of(context).accentColor),
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(20))),
          ),
        ),
        onTap: () {
          Provider.of<Orders>(
            context,
            listen: false,
          ).addOrder(
            cart.items.values.toList(),
            cart.totalAmount,
          );
          // setState(() {
          //   _isloading = false;
          // });
          cart.clearCart();
          Navigator.of(context).pushNamed(routeName);
        });
  }
}
