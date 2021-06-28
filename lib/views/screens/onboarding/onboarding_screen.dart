import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../models/slide_model.dart';
import '../../../utils/app_utils.dart';
import '../../../utils/color_palette.dart';
import '../../widgets/page_transition.dart';
import '../bottom_bar_view.dart';
import 'slide.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _pageController;
  int currentSlideIndex = 0;
  late List<SlideModel> slides = onboardingSlides;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: currentSlideIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  double progress(int slideIndex) {
    return ((slideIndex + 1) * 100) / slides.length;
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Color(0xFFCEE0BF).withOpacity(0.3),
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: ColorPalette.onBoardingScaffoldColor,
        body: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                children: [
                  for (int index = 0; index < slides.length; index++)
                    Slide(slides[index], progress(index))
                ],
                onPageChanged: (index) => setState(() {
                  currentSlideIndex = index;
                }),
              ),
            ),
            const SizedBox(height: 8.0),
            Container(
              width: double.maxFinite,
              padding: const EdgeInsets.symmetric(horizontal: 25),
              margin: const EdgeInsets.only(bottom: 33),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    child: SmoothPageIndicator(
                      controller: _pageController,
                      count: slides.length,
                      effect: ExpandingDotsEffect(
                        activeDotColor: Theme.of(context).primaryColor,
                        dotWidth: 8.h,
                        dotHeight: 8.h,
                        expansionFactor: 2.1,
                        dotColor: Color(0xFFA5BD99),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      splashColor: ColorPalette.primary,
                      child: Container(
                        height: 38.h,
                        width: 93.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(48.r),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [ColorPalette.primary, Color(0xFF008060)],
                          ),
                        ),
                        child: Text(
                          currentSlideIndex == (slides.length - 1)
                              ? "Finish"
                              : "Skip",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0.sp,
                            letterSpacing: 0.4,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      onTap: () => finish(),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void finish() {
    // save userOnboarding status to the local storage
    setUserOnBoardingStatus();

    Navigator.pushReplacement(
      context,
      PageTransition(
        type: PageTransitionType.bottomToTop,
        child: BottomBarView(),
      ),
    );
  }
}
