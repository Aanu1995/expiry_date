import 'package:flutter/material.dart';

// gives horizontal margin
class HMargin extends StatelessWidget {
  final double multiplier;
  const HMargin({this.multiplier = 1});
  @override
  Widget build(BuildContext context) {
    return SizedBox(width: 4 * multiplier);
  }
}

class VMargin extends StatelessWidget {
  final double multiplier;
  const VMargin({this.multiplier = 1});
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 4 * multiplier);
  }
}

double screenHeight(BuildContext context, {double percent = 1}) =>
    MediaQuery.of(context).size.height * percent;

double screenWidth(BuildContext context, {double percent = 1}) =>
    MediaQuery.of(context).size.width * percent;
