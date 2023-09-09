import 'package:flutter/cupertino.dart';

class AppDimensions {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
  }

  static double getProportionalScreenWidth(double width) {
    double proportionalWidth = screenWidth / 375 * width;
    return proportionalWidth;
  }

  static double getProportionalScreenHeight(double height) {
    double proportionalHeight = screenHeight / 812 * height;
    return proportionalHeight;
  }

  //heights
  static double height10 = getProportionalScreenHeight(10);
  static double height20 = getProportionalScreenHeight(20);
  static double height25 = getProportionalScreenHeight(25);
  static double height30 = getProportionalScreenHeight(30);
  static double height100 = getProportionalScreenHeight(100);

  //widths
  static double width10 = getProportionalScreenWidth(10);
  static double width20 = getProportionalScreenWidth(20);
  static double width100 = getProportionalScreenWidth(100);
}
