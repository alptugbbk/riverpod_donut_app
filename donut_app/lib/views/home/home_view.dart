import 'package:donut_app/controller/riverpod_center.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../product/widget/product_widget.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var watch = ref.watch(productRiverpod);
    var read = ref.read(productRiverpod);
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Expanded(
          child: ListView.builder(
            itemCount: read.products.length,
            itemBuilder: (BuildContext context, int index) {
              return ProductWidget(
                model: watch.products[index],
                setBasket: () => watch.setBasket(watch.products[index]),
                setFavorite: () => watch.setFavorite(watch.products[index]),
              );
            },
          ),
        ),
      ),
    );
  }
}
