import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/bars/topbar.dart';
import '../models/orders.dart';

import '../widgets/items/order_list_item.dart';

class OrderScreen extends StatefulWidget {
  static const routeName = '/orders';

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  var _isLoading = false;

  @override
  void initState() {
    Future.delayed(Duration.zero).then((_) async {
      setState(() {
        _isLoading = true;
      });
      await Provider.of<Orders>(context, listen: false).fetchAndSetOrders();
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<Orders>(context).orders;
    return Scaffold(
      appBar: TopBar(),
      body: Container(
        color: Theme.of(context).primaryColor,
        child: _isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(children: [
                AppBar(
                  title: Text("Orders from Database"),
                  centerTitle: true,
                  elevation: 0,
                ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: orders.length,
                    itemBuilder: (BuildContext context, i) {
                      return OrderListItem(orders[i]);
                    },
                  ),
                ),
              ]),
      ),
    );
  }
}
