import 'package:donut_app/product/defaultPadding/default_padding.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../models/product_model.dart';

class ProductWidget extends StatelessWidget {
  ProductModel model;
  Function setFavorite;
  Function setBasket;
  ProductWidget(
      {required this.model,
      required this.setBasket,
      required this.setFavorite});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: DefaultPadding.all(),
          child: Card(
            elevation: 7,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ClipRRect(
                  child: Image.asset(
                    model.imagePath,
                    fit: BoxFit.cover,
                    height: 90,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                IconButton(
                  onPressed: () => setBasket(),
                  icon: Icon(
                      color: Colors.orange,
                      model.isBasket
                          ? CupertinoIcons.cart_fill
                          : CupertinoIcons.cart),
                ),
                Column(
                  children: [
                    Text(model.title,
                        style: Theme.of(context).textTheme.headline6),
                    Text('Fiyat: ' + model.price.toString(),
                        style: Theme.of(context).textTheme.bodyLarge),
                  ],
                ),
                IconButton(
                    onPressed: () => setFavorite(),
                    icon: Icon(
                      color: Colors.red,
                      model.isFavorite
                          ? CupertinoIcons.heart_fill
                          : CupertinoIcons.heart,
                    )),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
