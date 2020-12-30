import 'package:cookbook/screens/confirm_order_screen.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/cart.dart';

class CartToOrderButton extends StatefulWidget {
  @override
  _CartToOrderBottonState createState() => _CartToOrderBottonState();
}

class _CartToOrderBottonState extends State<CartToOrderButton> {
  // var _isloading = false;
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 50.0,
          child: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
            Expanded(
              child: Center(
                child: cart.totalAmount != null
                    ? Text(
                        'Heildarupphæð: ${cart.totalAmount} kr.',
                        style: Theme.of(context).textTheme.button,
                      )
                    : Text('Heildarupphæð : 0 kr.',
                        style: Theme.of(context).textTheme.button),
              ),
            ),
            Center(
                child:
                    Text('Panta', style: Theme.of(context).textTheme.button)),
            IconButton(
                icon: Icon(
                  Icons.arrow_forward,
                  color: Theme.of(context).primaryColor,
                ),
                onPressed: null)
          ]),
          decoration: BoxDecoration(
              border: new Border.all(width: 1, color: Colors.transparent),
              color: Theme.of(context).accentColor,
              borderRadius: BorderRadius.all(Radius.circular(20))),
        ),
      ),
      onTap: () {
        (cart.totalAmount <= 0)
            ? null
            : Navigator.of(context).pushNamed(ConfirmOrderScreen.routeName);
      },
    );
  }
}
