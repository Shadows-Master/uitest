import 'package:flutter/material.dart';

import 'balance_widget.dart';


class DetailsCard extends StatelessWidget {
  const DetailsCard({
    Key key, this.title,
    this.icon, this.iconColor,
    this.containerColor, this.amount, this.percent='18.2',
  }) : super(key: key);
  final String title;
  final String amount;
  final IconData icon;
  final Color iconColor;
  final Color containerColor;
  final String percent;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 70,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                offset: Offset(1.0, 1.0),
                blurRadius: 4.2,
                color: Colors.black87.withOpacity(.1)
            )
          ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              margin: EdgeInsets.only(bottom: 25, top: 8),
              child: Icon(icon ?? Icons.shopping_bag, color: iconColor ?? Colors.red, size: 37,),
            ),
          ),
          SizedBox(height: 18),
          BalanceWidget(titleSize: 11, amountSize: 16, title: title, amount: amount,),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 12),
                    height: 3.5,
                    width: 25,
                    decoration: BoxDecoration(
                      color: containerColor ?? Colors.red,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  Flexible(child: Text('$percent%', style: TextStyle(color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w600),))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
