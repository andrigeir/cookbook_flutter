import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/cart.dart';

import '../items/cart_list_item.dart';
import '../items/cart_to_order_button.dart';

class CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _itemcount = Provider.of<Cart>(context).items.length;
    return Stack(children: [
      Container(
        color: Theme.of(context).primaryColor,
        child: ListView.builder(
          itemCount: _itemcount,
          itemBuilder: (BuildContext context, int i) {
            return CartListItem(
              index: i,
            );
          },
        ),
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: CartToOrderButton(),
      )
    ]);
  }
}
