import 'dart:math';

import 'package:cookbook/widgets/pdf_create_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/orders.dart';

class OrderListItem extends StatefulWidget {
  final OrderItem order;

  OrderListItem(this.order);

  @override
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderListItem> {
  var _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(
              DateFormat('dd/MM/yyyy').format(widget.order.dateTime) +
                  "  -  " +
                  '${widget.order.amount} kr.',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            trailing: IconButton(
              icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
            ),
          ),
          if (_expanded)
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              height: min(widget.order.products.length * 20.0 + 10, 100),
              child: ListView(
                children: widget.order.products
                    .map(
                      (prod) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(prod.title,
                              style: Theme.of(context).textTheme.subtitle1),
                          Text('${prod.quantity} x ${prod.price} kr.',
                              style: Theme.of(context).textTheme.subtitle1),
                          PdfButton()
                        ],
                      ),
                    )
                    .toList(),
              ),
            )
        ],
      ),
    );
  }
}
