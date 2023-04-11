import 'package:donut_app/constants/string_constants.dart';
import 'package:donut_app/controller/riverpod_center.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../product/widget/product_widget.dart';

class BasketView extends ConsumerWidget {
  const BasketView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var watch = ref.watch(productRiverpod);
    return Scaffold(
      body: watch.baskets.length == 0
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(StringConstants.notBasketString,
                      style: Theme.of(context).textTheme.headline6),
                  TextButton(
                    onPressed: () {
                      ref.watch(navbarRiverpod).setCurrentIndex(0);
                    },
                    child: const Text(
                      'Ürünler',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            )
          : SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: watch.baskets.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ProductWidget(
                          model: watch.products[index],
                          setBasket: () =>
                              watch.setBasket(watch.baskets[index]),
                          setFavorite: () =>
                              watch.setFavorite(watch.baskets[index]),
                        );
                      },
                    ),
                  ),
                  Text(
                    "Toplam Tutar: ${watch.totalPrice} ₺",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ],
              ),
            ),
    );
  }
}
