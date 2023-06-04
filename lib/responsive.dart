import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nested_navigation/injection.dart';

class Responsive {
  bool isThreeBarsMode(BuildContext context) {
    return context.width > 1300;
  }

  bool get isMobile =>
      defaultTargetPlatform == TargetPlatform.iOS ||
      defaultTargetPlatform == TargetPlatform.android;

  bool get isWebMode => kIsWeb && !isMobile;
}

extension BuildContextExtenstions on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
  Future<T?> to<T extends Object?>(Widget page) =>
      Navigator.push(this, MaterialPageRoute(builder: (_) => page));
}
