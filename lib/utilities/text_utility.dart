import 'package:date_picker_test/utilities/colors_utility.dart';
import 'package:flutter/cupertino.dart';

class TextStyleUtility {
  static TextStyle normalTextStyle(double size) {
    return TextStyle(fontSize: size, color: ColorsUtility.textColor);
  }

  static TextStyle boldTextStyle(double size) {
    return TextStyle(fontSize: size, fontWeight: FontWeight.bold,
        color: ColorsUtility.textColor);
  }

  static TextStyle textStyleColor(double size, Color color) {
    return TextStyle(fontSize: size, color: color);
  }

  static TextStyle bolTextStyleColor(double size, Color color) {
    return TextStyle(fontSize: size, color: color, fontWeight: FontWeight.bold);
  }
}