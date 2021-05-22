import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../../models/slide_model.dart';
import '../../../utils/color_utils.dart';
import '../../../utils/screen_utils.dart';

class Slide extends StatelessWidget {
  final SlideModel slideModel;
  final double percentProgress;
  const Slide(this.slideModel, this.percentProgress);
  @override
  Widget build(BuildContext context) {
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
                child: CircularStepProgressIndicator(
                  totalSteps: 100,
                  currentStep: percentProgress.toInt(),
                  stepSize: 10,
                  selectedColor: ColorUtils.secondary,
                  unselectedColor: Colors.transparent,
                  padding: 0,
                  width: 80,
                  height: 80,
                  selectedStepSize: 2,
                  roundedCap: (_, __) => true,
                ),
              )
            ],
          ),
        ),
        const VMargin(multiplier: 5),
        Expanded(
          flex: 4,
          child: Offstage(),
        ),
      ],
    );
  }
}
