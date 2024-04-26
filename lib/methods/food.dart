import 'package:project2/models/cartitem.dart';
import 'package:project2/models/food.dart';
import 'package:project2/models/restaurant.dart';
import 'package:flutter/material.dart';

class FoodMethods extends ChangeNotifier {
  final Restaurant _restaurant = Restaurant();
  final List<CartItem> _cart = [];
  List<CartItem> get cart => _cart;

  List<Food> get vietMenu => _restaurant.allFood["viet"];
  List<Food> get koreanMenu => _restaurant.allFood["korean"];
  List<Food> get spanishMenu => _restaurant.allFood["spanish"];
  List<Food> get italianMenu => _restaurant.allFood["italian"];
  List<Food> get americanMenu => _restaurant.allFood["american"];

  int get foodCount => _restaurant.allFood.length;
  List<String> get allFoodKey {
    return _restaurant.allFood.keys.toList();
  }

  List<List<Food>> get allFoodItems {
    return _restaurant.allFood.values.map((e) => e as List<Food>).toList();
  }

  void addToCart(Food food) {
    CartItem? cartItem;
    try {
      cartItem = _cart.firstWhere((item) => item.food == food);
    } catch (e) {
      cartItem = null;
    }

    if (cartItem != null) {
      cartItem.quantity++;
    } else {
      _cart.add(
        CartItem(food: food),
      );
    }
    notifyListeners();
  }

  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);

    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }

  void clearCart() {
    _cart.clear();
    notifyListeners();
  }
}

// class Restaurant extends ChangeNotifier {
// final List<CartItem> _cart = [];

// String _deliveryAddress = "123 Flint Drive, Atlanta, Georgia 30303";

// List<Food> get menu => _menu;
// List<CartItem> get cart => _cart;
// String get deliveryAddress => _deliveryAddress;

// void addToCart(Food food, List<Addon> selectedAddons) {
//   CartItem? cartIem = _cart.firstWhereOrNull((item) {
//     bool isSameFood = item.food == food;
//     bool isSameAddons =
//         ListEquality().equals(item.selectedAddons, selectedAddons);
//
//     return isSameFood && isSameAddons;
//   });
//
//   if (cartIem != null) {
//     cartIem.quantity++;
//   } else {
//     _cart.add(
//       CartItem(food: food, selectedAddons: selectedAddons),
//     );
//   }
//   notifyListeners();
// }

// void removeFromCart(CartItem cartItem) {
//   int cartIndex = _cart.indexOf(cartItem);

//   if (cartIndex != -1) {
//     if (_cart[cartIndex].quantity > 1) {
//       _cart[cartIndex].quantity--;
//     } else {
//       _cart.removeAt(cartIndex);
//     }
//   }
//   notifyListeners();
// }

// double getTotalPrice() {
//   double total = 0.0;

//   for (CartItem cartItem in _cart) {
//     double itemTotal = cartItem.food.price;

//     for (Addon addon in cartItem.selectedAddons) {
//       itemTotal += addon.price;
//     }

//     total += itemTotal * cartItem.quantity;
//   }

//   return total;
// }

// int getTotalItemCount() {
//   int totalItemCount = 0;

//   for (CartItem cartItem in _cart) {
//     totalItemCount += cartItem.quantity;
//   }

//   return totalItemCount;
// }

// void clearCart() {
//   _cart.clear();
//   notifyListeners();
// }

// void updateDeliveryAddress(String newAddress) {
//   _deliveryAddress = newAddress;
//   notifyListeners();
// }

// String displayCartReceipt() {
//   final receipt = StringBuffer();
//   receipt.writeln("Here's your receipt:");
//   receipt.writeln();

//   String formattedDate =
//       DateFormat('yyyy-mm-dd hh:mm:ss').format(DateTime.now());

//   receipt.writeln(formattedDate);
//   receipt.writeln();
//   receipt.writeln(
//       "---------------------------------------------------------------------");
//   receipt.writeln();

//   for (final cartItem in _cart) {
//     receipt.writeln(
//         "${cartItem.quantity} x ${cartItem.food.name} - ${_formatPrice(cartItem.food.price)}");
//     if (cartItem.selectedAddons.isNotEmpty) {
//       receipt
//           .writeln("     Add-ons: ${_formatAddons(cartItem.selectedAddons)}");
//     }
//     receipt.writeln();
//   }
//   receipt.writeln(
//       "---------------------------------------------------------------------");
//   receipt.writeln();
//   receipt.writeln("Total Items: ${getTotalItemCount()}");
//   receipt.writeln("Total Price: ${_formatPrice(getTotalPrice())}");
//   receipt.writeln();
//   receipt.writeln("Delivering to: $deliveryAddress");

//   return receipt.toString();
// }

// String _formatPrice(double price) {
//   return "\$${price.toStringAsFixed(2)}";
// }

// String _formatAddons(List<Addon> addons) {
//   return addons
//       .map((addon) => "${addon.name} (${_formatPrice(addon.price)})")
//       .join(", ");
// }
// }
