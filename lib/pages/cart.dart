import 'package:testproject2/components/button.dart';
import 'package:testproject2/components/carttile.dart';
import 'package:testproject2/models/restaurant.dart';
import 'package:testproject2/pages/payment.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(builder: (context, restaurant, child) {
      final userCart = restaurant.cart;

      return Scaffold(
        appBar: AppBar(
          title: Text('Cart',
            style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),),
          backgroundColor: Colors.transparent,
          foregroundColor: Theme.of(context).colorScheme.primary,
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: Text(
                            "Are you sure you want to clear the cart?",
                            style: TextStyle(fontSize: 20),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                restaurant.clearCart();
                              },
                              child: Text('Yes'),
                            ),
                          ],
                        ));
              },
              icon: Icon(Icons.delete),
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  userCart.isEmpty
                      ? Expanded(
                          child: Center(
                            child: Text(
                              "Cart is empty",
                              style: TextStyle(
                                  color:
                                  Theme.of(context).colorScheme.primary),
                            ),
                          ),
                        )
                      : Expanded(
                          child: ListView.builder(
                              itemCount: userCart.length,
                              itemBuilder: (context, index) {
                                final cartItem = userCart[index];
                                return MyCartTile(cartItem: cartItem);
                              }),
                        ),
                ],
              ),
            ),
            MyButton(
              text: "Checkout",
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PaymentPage()),
              ),
            ),
            SizedBox(
              height: 25,
            )
          ],
        ),
      );
    });
  }
}
