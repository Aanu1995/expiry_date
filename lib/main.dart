import 'package:flutter/material.dart';

import 'utils/color_utils.dart';
import 'views/pages/onboarding/onboarding_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final colorUtils = ColorUtils();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expiry Date',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: colorUtils.primarySwatch()),
      home: OnBoardingScreen(),
    );
  }
}
