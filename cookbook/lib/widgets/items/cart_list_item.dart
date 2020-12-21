import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../../models/cart.dart';
import '../../models/products.dart';

class CartListItem extends StatefulWidget {
  const CartListItem({
    Key key,
    @required this.index,
  }) : super(key: key);

  final int index;

  @override
  _CartListItemState createState() => _CartListItemState();
}

class _CartListItemState extends State<CartListItem> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final cartItem = Provider.of<CartItem>(context, listen: false);
    final cartItems = cart.items;
    return Dismissible(
      key: Key(cart.items.keys.toList()[widget.index]),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        cart.removeItem(cart.items.keys.toList()[widget.index]);
      },
      background: Container(
        color: Theme.of(context).accentColor.withOpacity(0.5),
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 30),
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                Products()
                    .findImgById(cartItems.values.toList()[widget.index].id),
                height: 120,
                width: 120,
                fit: BoxFit.fitWidth,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(children: [
                      Text('${cartItems.values.toList()[widget.index].title}  ',
                          style: Theme.of(context).textTheme.headline4)
                    ]),
                    Row(
                      children: [
                        Text(
                          cartItem.mapType.keys.firstWhere(
                              (k) =>
                                  cartItem.mapType[k] ==
                                  cartItems.values.toList()[widget.index].type,
                              orElse: null),
                        ),
                        // toBeginningOfSentenceCase(
                        // cartItems.values
                        //     .toList()[widget.index]
                        //     .type
                        //     .toString()
                        //     .substring(8),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          cartItem.mapSize.keys.firstWhere(
                              (k) =>
                                  cartItem.mapSize[k] ==
                                  cartItems.values.toList()[widget.index].size,
                              orElse: null),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          cartItems.values.toList()[widget.index].candy.reduce(
                                ((value, element) => value + ',' + element),
                              ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            Text(
                                '${cartItems.values.toList()[widget.index].price.toString()} kr.'),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5),
                        ),
                        Column(
                          children: [
                            Text(
                                '${cartItems.values.toList()[widget.index].quantity} stk')
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                IconButton(
                  icon: Icon(Icons.add),
                  color: Theme.of(context).accentColor,
                  onPressed: () {
                    setState(() {
                      cart.increaseQuantity(
                          cartItems.keys.toList()[widget.index].toString());
                    });
                  },
                ),
                SizedBox(
                  height: 50,
                ),
                IconButton(
                  icon: Icon(Icons.remove),
                  color: Theme.of(context).accentColor,
                  onPressed: () {
                    setState(
                      () {
                        if (cartItems.values.toList()[widget.index].quantity >
                            1) {
                          cart.decreaseQuantity(
                              cartItems.keys.toList()[widget.index].toString());
                        }
                      },
                    );
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
