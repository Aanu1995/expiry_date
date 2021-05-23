import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../../models/slide_model.dart';
import '../../../utils/image_utils.dart';
import '../../../utils/screen_utils.dart';

class Slide extends StatelessWidget {
  final SlideModel slideModel;
  final double percentProgress;
  const Slide(this.slideModel, this.percentProgress);
  @override
  Widget build(BuildContext context) {
    final double progressCircleWidth = screenWidth(context) * 0.25;
    final double imageWidth = progressCircleWidth / 2.0;

    return Column(
      children: [
        Expanded(
          flex: 4,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                slideModel.image!,
                fit: BoxFit.fitWidth,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Material(
                  elevation: 10.0,
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
                        height: progressCircleWidth,
                        width: progressCircleWidth,
                        padding: 0,
                        selectedStepSize: 2,
                        roundedCap: (_, __) => true,
                      ),
                      Image.asset(
                        ImageUtils.slideProgress,
                        height: imageWidth,
                        width: imageWidth,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        const Spacer(flex: 1),
        Expanded(
          flex: 2,
          child: Column(
            children: [
              Text(
                slideModel.title!,
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const VMargin(multiplier: 4),
              SizedBox(
                width: screenWidth(context) * 0.7,
                child: Text(
                  slideModel.description!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 18.0),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
