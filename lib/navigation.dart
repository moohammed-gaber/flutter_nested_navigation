
import 'package:flutter/material.dart';

enum TransitionType { slide, noAnimation }

final materialNavigationKey = GlobalKey<NavigatorState>();

abstract class Navigation {
  Route createAnimatedRoute(Widget page,
      {TransitionType transitionType = TransitionType.noAnimation}) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        switch (transitionType) {
          case TransitionType.slide:
            const begin = Offset(0.0, 1.0);
            const end = Offset.zero;
            const curve = Curves.ease;
            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
            break;
          case TransitionType.noAnimation:
            return child;
            break;
        }
      },
    );
  }

  Route<dynamic>? onGenerateRoute(RouteSettings settings);
}
