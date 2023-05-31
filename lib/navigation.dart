import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:nested_navigation/chat.dart';
import 'package:nested_navigation/controller.dart';
import 'package:nested_navigation/end_bar.dart';
import 'package:nested_navigation/entities.dart';
import 'package:nested_navigation/injection.dart';
import 'package:nested_navigation/main.dart';

enum TransitionType { slide, noAnimation }

class Navigation {
  final chatKey = GlobalKey<NavigatorState>();
  final endBarKey = GlobalKey<NavigatorState>();

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

  Route<dynamic>? onGenerateChatRoute(RouteSettings settings) {
    switch (settings.name) {
      case Chat.route:
        return navigation.createAnimatedRoute(Chat(
          room: settings.arguments as RoomEntity,
        ));
      case IdleChat.route:
        return navigation.createAnimatedRoute(IdleChat());
      default:
    }
  }
  Route<dynamic>? onGenerateEndBarRoute(RouteSettings settings) {
    switch (settings.name) {
      case Profile.route:
        return navigation.createAnimatedRoute(Profile());
      case IdleEndBar.route:
        return navigation.createAnimatedRoute(IdleEndBar());
      default:
    }
  }
}
