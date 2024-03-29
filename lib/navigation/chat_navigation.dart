import 'package:flutter/material.dart';
import 'package:nested_navigation/chat.dart';
import 'package:nested_navigation/entities.dart';
import 'package:nested_navigation/navigation.dart';
import 'package:nested_navigation/responsive.dart';

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
        return createAnimatedRoute(const IdleChat());
      default:
    }
    return null;
  }

  @override
  Future<T?> toChat<T extends Object?>() {
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
