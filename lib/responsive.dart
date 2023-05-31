import 'package:flutter/material.dart';
class Responsive {
  bool isThreeBarsMode(BuildContext context) {
    return context.width > 1300;
  }
  bool isOnlyUserImageMode(BuildContext context) {
    return context.width < 550;
  }

}

extension BuildContextExtenstions on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
}
