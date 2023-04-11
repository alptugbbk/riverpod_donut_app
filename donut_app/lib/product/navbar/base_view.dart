import 'package:donut_app/constants/color_constants.dart';
import 'package:donut_app/controller/riverpod_center.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BaseView extends ConsumerStatefulWidget {
  const BaseView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BaseViewState();
}

class _BaseViewState extends ConsumerState<BaseView> {
  @override
  Widget build(BuildContext context) {
    var watch = ref.watch(navbarRiverpod);
    var read = ref.read(navbarRiverpod);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        selectedItemColor: ColorConstants.redx,
        items: read.items,
        currentIndex: watch.currentIndex,
        onTap: (index) => watch.setCurrentIndex(index),
      ),
      body: watch.body(),
    );
  }
}
