import 'package:flutter/material.dart';

class OrderDetailsBody extends StatefulWidget {
  const OrderDetailsBody({Key? key}) : super(key: key);

  @override
  _OrderDetailsBodyState createState() => _OrderDetailsBodyState();
}

class _OrderDetailsBodyState extends State<OrderDetailsBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            child: Text('Order Details'),
          ),
        ],
      ),
    );
  }
}
