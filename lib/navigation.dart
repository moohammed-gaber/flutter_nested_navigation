import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:nested_navigation/chat.dart';
import 'package:nested_navigation/controller.dart';
import 'package:nested_navigation/end_bar.dart';
import 'package:nested_navigation/entities.dart';
import 'package:nested_navigation/injection.dart';
import 'package:nested_navigation/main.dart';
import 'package:nested_navigation/responsive.dart';

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

abstract class IChatNavigation {
  Future<T?> toChat<T extends Object?>();
}

class WideModeChatNavigation extends Navigation implements IChatNavigation {
  final key = GlobalKey<NavigatorState>();

  @override
  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Chat.route:
        return createAnimatedRoute(Chat(
          room: settings.arguments as RoomEntity,
        ));
      case IdleChat.route:
        return createAnimatedRoute(IdleChat());
      default:
    }
    return null;
  }

  @override
  Future<T?> toChat<T extends Object?>() {
    print('heloooooo');
    return key.currentState!
        .pushNamed(Chat.route, arguments: RoomEntity(name: 'Helelo'));
  }
}

class NormalModeChatNavigation implements IChatNavigation {
  @override
  Future<T?> toChat<T extends Object?>() {
    return materialNavigationKey.currentState!.context
        .to(Chat(room: RoomEntity(name: 'Helelo')));
  }
}

abstract class NavigationAbstractFactory {
  IChatSettingNavigation get chatSettingNavigation;
  IChatNavigation get chatNavigation;
}

class NavigationFactoryProducer {
  final Responsive _responsive;

  NavigationFactoryProducer(this._responsive);

  NavigationAbstractFactory getFactory() {
    return _responsive.isWebMode
        ? wideModeNavigationFactory
        : normalModeNavigationFactory;
  }
}

class WideModeNavigationAbstractFactory implements NavigationAbstractFactory {
  @override
  IChatNavigation get chatNavigation {
    return wideModeChatNavigation;
  }

  @override
  IChatSettingNavigation get chatSettingNavigation {
    return wideModeChatSettingNavigation;
  }
}

class NormalModeNavigationAbstractFactory implements NavigationAbstractFactory {
  @override
  IChatNavigation get chatNavigation {
    return normalModeChatNavigation;
  }

  @override
  IChatSettingNavigation get chatSettingNavigation {
    return normaModeChatSettingNavigation;
  }
}

abstract class IChatSettingNavigation {
  Future<T?> toMedia<T extends Object?>();
  Future<T?> toProfile<T extends Object?>();
  void pop<T extends Object?>([T? result]);
  Widget get popButton;
}

class WideModeChatSettingNavigation extends Navigation
    implements IChatSettingNavigation {
  final key = GlobalKey<NavigatorState>();

  @override
  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Profile.route:
        return createAnimatedRoute(Profile());
      case IdleChatSetting.route:
        return createAnimatedRoute(IdleChatSetting());
      case Media.route:
        return createAnimatedRoute(Media());

      default:
    }
    return null;
  }

  @override
  Future<T?> toMedia<T extends Object?>() {
    return key.currentState!.pushNamed(Media.route);
  }

  @override
  Future<T?> toProfile<T extends Object?>() {
    controller.expand();
    return key.currentState!.pushNamed(Profile.route);
  }

  @override
  void pop<T extends Object?>([T? result]) {
    controller.collapse();
  }

  @override
  Widget get popButton => IconButton(onPressed: pop, icon: Icon(Icons.cancel));
}

class NormaModeChatSettingNavigation implements IChatSettingNavigation {
  @override
  Future<T?> toMedia<T extends Object?>() {
    return materialNavigationKey.currentState!.context.to(Media());
  }

  @override
  Widget get popButton =>
      IconButton(onPressed: pop, icon: Icon(Icons.arrow_back_ios_new));

  @override
  Future<T?> toProfile<T extends Object?>() {
    return materialNavigationKey.currentState!.context.to(Profile());
  }

  @override
  void pop<T extends Object?>([T? result]) {
    return materialNavigationKey.currentState!.pop();
  }
}
