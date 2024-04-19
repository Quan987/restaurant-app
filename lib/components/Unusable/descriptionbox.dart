import 'package:flutter/material.dart';

class MyDescrptionBox extends StatelessWidget {
  const MyDescrptionBox({super.key});

  @override
  Widget build(BuildContext context) {
    var myPrimaryTextStyle = TextStyle(
      color: Theme.of(context).colorScheme.primary,
      fontWeight: FontWeight.bold,
    );
    var mySecondaryTextStyle = TextStyle(
      color: Theme.of(context).colorScheme.tertiary,
    );

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      padding: EdgeInsets.all(25),
      margin: EdgeInsets.only(left: 25, right: 25, bottom: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                '\$4.99',
                style: myPrimaryTextStyle.copyWith(
                  color: Colors.green,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Delivery Fee',
                style: mySecondaryTextStyle,
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.orange.shade100,
            ),
            child: Icon(
              Icons.delivery_dining,
              color: Colors.orange,
              size: 30,
            ),
          ),
          Column(
            children: [
              Text(
                '15-20 min',
                style: myPrimaryTextStyle.copyWith(
                  color: Colors.red,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Delivery Time',
                style: mySecondaryTextStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
