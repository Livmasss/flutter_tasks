import 'dart:ffi';

class CartItemModel {
  CartItemModel(
      this.title,
      this.price,
      this.patientsNumber
      );

  final String title;
  final Int price;
  final Int patientsNumber;
}