
import 'package:donut_app/views/basket/basket_view.dart';
import 'package:donut_app/views/favorite/favorite_view.dart';
import 'package:donut_app/views/home/home_view.dart';
import 'package:flutter/material.dart';

class NavBarRiverpod extends ChangeNotifier {
  List<BottomNavigationBarItem> items = const [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
    BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'favori'),
    BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: 'sepet'),
  ];
  int currentIndex = 0;
  void setCurrentIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  Widget body() {
    switch (currentIndex) {
      case 0:
        return HomeView();
      case 1:
        return FavoriteView();
      case 2:
        return BasketView();
      default:
        return HomeView();
    }
  }
}
