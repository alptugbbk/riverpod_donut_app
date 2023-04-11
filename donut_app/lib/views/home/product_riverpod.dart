import 'package:donut_app/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductRiverpod extends ChangeNotifier {
  List<ProductModel> favorites = [];
  List<ProductModel> baskets = [];
  double totalPrice = 0.0;
  List<ProductModel> products = [
    ProductModel(
        title: 'donut-0',
        imagePath: 'assets/icons/ic_donut_0.png',
        isFavorite: false,
        isBasket: false,
        price: 30),
    ProductModel(
        title: 'donut-1',
        imagePath: 'assets/icons/ic_donut_1.png',
        isFavorite: false,
        isBasket: false,
        price: 25),
    ProductModel(
        title: 'donut-2',
        imagePath: 'assets/icons/ic_donut_2.png',
        isFavorite: false,
        isBasket: false,
        price: 35),
    ProductModel(
        title: 'donut-3',
        imagePath: 'assets/icons/ic_donut_3.png',
        isFavorite: false,
        isBasket: false,
        price: 40),
    ProductModel(
        title: 'donut-4',
        imagePath: 'assets/icons/ic_donut_4.png',
        isFavorite: false,
        isBasket: false,
        price: 30),
    ProductModel(
        title: 'donut-5',
        imagePath: 'assets/icons/ic_donut_5.png',
        isFavorite: false,
        isBasket: false,
        price: 20),
    ProductModel(
        title: 'donut-6',
        imagePath: 'assets/icons/ic_donut_6.png',
        isFavorite: false,
        isBasket: false,
        price: 50),
  ];

  void setFavorite(ProductModel model) {
    if (model.isFavorite) {
      model.isFavorite = false;
      favorites.remove(model);
      notifyListeners();
    } else {
      model.isFavorite = true;
      favorites.add(model);
      notifyListeners();
    }
  }

  void setBasket(ProductModel model) {
    if (model.isBasket) {
      model.isBasket = false;
      baskets.remove(model);
      notifyListeners();
    } else {
      model.isBasket = true;
      baskets.add(model);
      setTotalPrice(model);
      notifyListeners();
    }
  }

  void setTotalPrice(ProductModel model) {
    totalPrice += model.price;
  }
}
