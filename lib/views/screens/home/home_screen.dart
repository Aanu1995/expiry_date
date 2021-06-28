import 'package:flutter/material.dart';

import '../../../utils/color_palette.dart';
import '../../widgets/bottom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.homeScreenScaffoldColor,
      body: Container(),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
