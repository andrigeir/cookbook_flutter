import 'package:cookbook/widgets/bars/menubar.dart';
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
    final orders = Provider.of<Orders>(context).orders.reversed.toList();
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: TopBar(),
      body: Container(
        color: Theme.of(context).primaryColor,
        child: _isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                shrinkWrap: false,
                itemCount: orders.length,
                itemBuilder: (
                  BuildContext context,
                  i,
                ) {
                  if (i == 0) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(40.0),
                          child: Center(
                            child: Text(
                              "Þínar Pantanir",
                              style: Theme.of(context).textTheme.headline4,
                            ),
                          ),
                        ),
                        OrderListItem(orders[i])
                      ],
                    );
                  }
                  return OrderListItem(orders[i]);
                },
              ),
      ),
      bottomNavigationBar: MenuBar(),
    );
  }
}
