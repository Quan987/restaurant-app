import 'package:flutter/material.dart';

class AddressMethods extends ChangeNotifier {
  String _deliveryAddress = "123 Flint Drive, Atlanta, Georgia 30303";
  String get deliveryAddress => _deliveryAddress;

  void updateDeliveryAddress(String newAddress) {
    _deliveryAddress = newAddress;
    notifyListeners();
  }
}