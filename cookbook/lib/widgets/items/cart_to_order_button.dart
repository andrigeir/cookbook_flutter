import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/cart.dart';
import '../../models/orders.dart';

class CartToOrderButton extends StatefulWidget {
  @override
  _CartToOrderBottonState createState() => _CartToOrderBottonState();
}

class _CartToOrderBottonState extends State<CartToOrderButton> {
  var _isloading = false;
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return _isloading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : cart.totalAmount <= 0
            ? Center(
                child: Text(
                  "You Cart is Empty",
                  style: Theme.of(context).textTheme.headline4,
                ),
              )
            : InkWell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 50.0,
                    child:
                        Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                      Expanded(
                        child: Center(
                          child: cart.totalAmount != null
                              ? Text(
                                  'Total: ${cart.totalAmount} kr.',
                                  style: Theme.of(context).textTheme.button,
                                )
                              : Text('Total : 0 kr.',
                                  style: Theme.of(context).textTheme.button),
                        ),
                      ),
                      Center(
                          child: Text('Order',
                              style: Theme.of(context).textTheme.button)),
                      IconButton(
                          icon: Icon(
                            Icons.arrow_forward,
                            color: Theme.of(context).primaryColor,
                          ),
                          onPressed: null)
                    ]),
                    decoration: BoxDecoration(
                        border:
                            new Border.all(width: 1, color: Colors.transparent),
                        color: Theme.of(context).accentColor,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                  ),
                ),
                onTap: (cart.totalAmount <= 0 || _isloading)
                    ? null
                    : () async {
                        setState(() {
                          _isloading = true;
                        });
                        await Provider.of<Orders>(
                          context,
                          listen: false,
                        ).addOrder(
                          cart.items.values.toList(),
                          cart.totalAmount,
                        );
                        setState(() {
                          _isloading = false;
                        });
                        cart.clearCart();
                      },
              );
  }
}
