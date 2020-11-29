import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/product.dart';
import '../../models/cart.dart';

class CartBottomBorder extends StatefulWidget {
  final Product loadedProduct;
  CartBottomBorder({Key key, @required this.loadedProduct}) : super(key: key);

  @override
  _CartBottomBorderState createState() => _CartBottomBorderState();
}

class _CartBottomBorderState extends State<CartBottomBorder> {
  @override
  Widget build(BuildContext context) {
    CartItem cartItem = Provider.of<CartItem>(context).getCartItem;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 50.0,
        child: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
          IconButton(
              icon: Icon(
                Icons.add,
                color: Theme.of(context).primaryColor,
              ),
              onPressed: () {
                setState(() {
                  cartItem.quantity++;
                });
              }),
          Text('${cartItem.quantity} x',
              style: Theme.of(context).textTheme.button),
          IconButton(
              icon: Icon(Icons.remove, color: Theme.of(context).primaryColor),
              onPressed: () {
                setState(() {
                  if (cartItem.quantity > 1) {
                    cartItem.quantity--;
                  }
                });
              }),
          Expanded(
            child: Text('${widget.loadedProduct.title}',
                style: Theme.of(context).textTheme.button),
          ),
          Text(
            '${cartItem.price * cartItem.quantity} kr.',
            style: Theme.of(context).textTheme.button,
          ),
          Consumer<Cart>(
            builder: (context, cart, child) => IconButton(
                icon: Icon(
                  Icons.add_shopping_cart,
                  color: Theme.of(context).primaryColor,
                ),
                onPressed: () {
                  cart.addItem(
                    widget.loadedProduct.id,
                    widget.loadedProduct.title,
                    cartItem.type,
                    cartItem.size,
                    cartItem.quantity,
                    cartItem.price,
                    new List.from(cartItem.candy),
                  );
                }),
          )
        ]),
        decoration: BoxDecoration(
            border: new Border.all(width: 1, color: Colors.transparent),
            color: Theme.of(context).accentColor,
            borderRadius: BorderRadius.all(Radius.circular(20))),
      ),
    );
  }
}
