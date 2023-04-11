import 'package:donut_app/constants/string_constants.dart';
import 'package:donut_app/controller/riverpod_center.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../product/widget/product_widget.dart';

class FavoriteView extends ConsumerWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var watch = ref.watch(productRiverpod);
    var read = ref.read(productRiverpod);
    return Scaffold(
      body: watch.favorites.length == 0
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(StringConstants.notFavoriteString,
                      style: Theme.of(context).textTheme.headline6),
                  TextButton(
                    onPressed: () {
                      ref.watch(navbarRiverpod).setCurrentIndex(0);
                    },
                    child: Text(
                      'Ürünler',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            )
          : SafeArea(
              child: Expanded(
                child: ListView.builder(
                  itemCount: watch.favorites.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ProductWidget(
                      model: watch.favorites[index],
                      setBasket: () => watch.setBasket(watch.products[index]),
                      setFavorite: () =>
                          watch.setFavorite(watch.favorites[index]),
                    );
                  },
                ),
              ),
            ),
    );
  }
}
