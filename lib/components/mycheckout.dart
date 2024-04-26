import 'package:project2/providers/food.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyCheckout extends StatelessWidget {
  const MyCheckout({Key? key});

  @override
  Widget build(BuildContext context) {
    DateTime currentTime = DateTime.now();
    DateTime estimatedDeliveryTime = currentTime.add(Duration(minutes: 15));

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(25, 50, 25, 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "ORDER RECEIPT",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        // Call driver action
                      },
                      icon: const Icon(Icons.call),
                    ),
                    IconButton(
                      onPressed: () {
                        // Message driver action
                      },
                      icon: const Icon(Icons.message),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 25),
            Text(
              "Estimated Delivery Time: ${estimatedDeliveryTime.hour}:${estimatedDeliveryTime.minute}",
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 25),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).colorScheme.secondary,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.all(25),
              child: Consumer<FoodMethods>(
                builder: (context, restaurant, child) => Text(
                  "Driver: John Doe\n\n${restaurant.displayCartReceipt()}",
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}