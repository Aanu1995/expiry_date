import 'package:expire_date/utils/color_palette.dart';
import 'package:flutter/material.dart';

import '../../widgets/bottom_nav_bar.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.productsScreenScaffoldColor,
      body: Container(),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
