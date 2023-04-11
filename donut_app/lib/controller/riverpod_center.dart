import 'package:donut_app/views/home/product_riverpod.dart';
import 'package:donut_app/product/navbar/navbar_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final navbarRiverpod = ChangeNotifierProvider((_) => NavBarRiverpod());
final productRiverpod = ChangeNotifierProvider((_) => ProductRiverpod());
