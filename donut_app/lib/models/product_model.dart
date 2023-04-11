import 'package:flutter/material.dart';

class ProductModel {
  String title;
  double price;
  String imagePath;
  bool isFavorite;
  bool isBasket;

  ProductModel(
      {required this.title,
      required this.imagePath,
      required this.isFavorite,
      required this.price,
      required this.isBasket});
}
