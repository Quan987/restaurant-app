import 'package:project2/models/cartitem.dart';
import 'package:project2/methods/address.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ReceiptMethods extends ChangeNotifier {
  final List<CartItem> _cart = [];

  String displayCartReceipt() {
    final AddressMethods _addressMethods = AddressMethods();
    final receipt = StringBuffer();
    receipt.writeln("Here's your receipt:");
    receipt.writeln();

    String formattedDate =
        DateFormat('yyyy-mm-dd hh:mm:ss').format(DateTime.now());

    receipt.writeln(formattedDate);
    receipt.writeln();
    receipt.writeln(
        "---------------------------------------------------------------------");
    receipt.writeln();

    for (final cartItem in _cart) {
      receipt.writeln(
          "${cartItem.quantity} x ${cartItem.food.name} - ${_formatPrice(cartItem.food.price)}");
      receipt.writeln();
    }
    receipt.writeln(
        "---------------------------------------------------------------------");
    receipt.writeln();
    receipt.writeln("Total Items: ${getTotalItemCount()}");
    receipt.writeln("Total Price: ${_formatPrice(getTotalPrice())}");
    receipt.writeln();
    receipt.writeln("Delivering to: ${_addressMethods.deliveryAddress}");

    return receipt.toString();
  }

  double getTotalPrice() {
    double total = 0.0;

    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;
      total += itemTotal * cartItem.quantity;
    }

    return total;
  }

  int getTotalItemCount() {
    int totalItemCount = 0;

    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }

    return totalItemCount;
  }

  String _formatPrice(double price) {
    return "\$${price.toStringAsFixed(2)}";
  }
}















