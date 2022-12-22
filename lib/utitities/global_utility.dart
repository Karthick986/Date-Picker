import 'package:flutter/cupertino.dart';

class GlobalUtility {
  static double buildWidth(context) {
    return MediaQuery.of(context).size.width;
  }

  static double buildHeight(context) {
    return MediaQuery.of(context).size.height;
  }
}