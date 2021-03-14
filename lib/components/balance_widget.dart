import 'package:flutter/material.dart';

class BalanceWidget extends StatelessWidget {
  const BalanceWidget({
    Key key, this.title, this.amount = '70110',
    this.titleSize=16, this.amountSize=22,
  }) : super(key: key);

  final String title;
  final String amount;
  final double titleSize;
  final double amountSize;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title ?? 'Total Spend', style: TextStyle(fontSize: titleSize, fontWeight: FontWeight.w400, color: Colors.grey),),
          Text('₹ $amount', style: TextStyle(fontSize: amountSize, fontWeight: FontWeight.w900),),
        ],
      ),
    );
  }
}
