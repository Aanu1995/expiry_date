import 'package:flutter/material.dart';

import '../utils/image_utils.dart';

class SlideModel {
  final String? image;
  final String? title;
  final String? description;

  const SlideModel({
    @required this.image,
    @required this.title,
    @required this.description,
  });
}

List<SlideModel> onboardingSlides = [
  SlideModel(
    image: ImageUtils.slide2,
    title: "Do With Little",
    description: "Let's do something wholesome with what you have",
  ),
  SlideModel(
    image: ImageUtils.slide2,
    title: "Avoid Wasting Food",
    description: "Track all foods in your inventory by expiry dates",
  ),
  SlideModel(
    image: ImageUtils.slide2,
    title: "Easy Editing",
    description: "Edit items seamlessly as you go",
  )
];
