import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../models/slide_model.dart';
import '../../../utils/color_utils.dart';
import '../../../utils/screen_utils.dart';
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
    return Scaffold(
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
          const VMargin(multiplier: 5),
          SafeArea(
            child: Container(
              width: double.maxFinite,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              margin: EdgeInsets.only(bottom: 16.0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    child: SmoothPageIndicator(
                      controller: _pageController,
                      count: slides.length,
                      effect: ExpandingDotsEffect(
                        activeDotColor: Theme.of(context).primaryColor,
                        dotWidth: 8,
                        dotHeight: 8,
                        dotColor: Color(0xFFA5BD99),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      child: Container(
                        height: 35.0,
                        width: 94.0,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [ColorUtils.primary, Color(0xFF008060)],
                          ),
                        ),
                        child: Text(
                          "Skip",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 17.0,
                          ),
                        ),
                      ),
                      onTap: () {},
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
