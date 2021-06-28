import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'utils/color_utils.dart';
import 'views/pages/onboarding/onboarding_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final colorUtils = ColorUtils();

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812), // Figma screen design size
      builder: () {
        return MaterialApp(
          title: 'Expiry Date',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: colorUtils.primarySwatch(),
            fontFamily: "Open Sans",
          ),
          home: OnBoardingScreen(),
        );
      },
    );
  }
}
