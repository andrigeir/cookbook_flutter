import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/bars/topbar.dart';
import '../models/orders.dart';

import '../widgets/items/order_list_item.dart';

class OrderScreen extends StatelessWidget {
  static const routeName = '/orders';

  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<Orders>(context).orders;
    return Scaffold(
      appBar: TopBar(),
      body: Container(
        color: Theme.of(context).primaryColor,
        child: ListView.builder(
          itemCount: orders.length,
          itemBuilder: (
            BuildContext context,
            i,
          ) =>
              OrderListItem(orders[i]),
        ),
      ),
    );
  }
}
