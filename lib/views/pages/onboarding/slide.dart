import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../../models/slide_model.dart';
import '../../../utils/image_utils.dart';

class Slide extends StatelessWidget {
  final SlideModel slideModel;
  final double percentProgress;
  Slide(this.slideModel, this.percentProgress);

  final _style = TextStyle(
    fontSize: 18.0.sp,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.33,
    height: 1.4,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 4,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(slideModel.image!, fit: BoxFit.fitWidth),
              Align(
                alignment: Alignment.bottomCenter,
                child: Material(
                  elevation: 10.0,
                  color: Colors.white,
                  shape: CircleBorder(),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CircularStepProgressIndicator(
                        totalSteps: 100,
                        currentStep: percentProgress.toInt(),
                        stepSize: 8,
                        unselectedColor: Colors.transparent,
                        gradientColor: LinearGradient(
                          begin: Alignment.bottomCenter,
                          colors: [Color(0xFF2F4858), Color(0xFF4BBD15)],
                        ),
                        height: 88.h,
                        width: 88.w,
                        padding: 0,
                        selectedStepSize: 2,
                        roundedCap: (_, __) => true,
                      ),
                      Image.asset(
                        ImageUtils.slideProgress,
                        height: 38.h,
                        width: 26.w,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        const Spacer(),
        Expanded(
          flex: 2,
          child: Column(
            children: [
              Text(
                slideModel.title!,
                style: _style,
              ),
              SizedBox(height: 16.h),
              SizedBox(
                width: 275.w,
                child: Text(
                  slideModel.description!,
                  textAlign: TextAlign.center,
                  style: _style.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 16.0.sp,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
