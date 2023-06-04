/*
import 'package:flutter/material.dart';

abstract class NavigationKeys {
  GlobalKey<NavigatorState> get chatKey;
  GlobalKey<NavigatorState> get endBarKey;
  Future<T?> toMessage<T extends Object?>();
}

class NormalModeNavigationKeys implements NavigationKeys {
  @override
  GlobalKey<NavigatorState> get chatKey => materialNavigationKey;
  @override
  GlobalKey<NavigatorState> get endBarKey => materialNavigationKey;

  @override
  Future<T?> toMessage<T extends Object?>() {
    return materialNavigationKey.currentState!.context
        .to(Chat(room: RoomEntity(name: 'Hello')));
  }
}

class WideModeNavigationKeys implements NavigationKeys {
  @override
  GlobalKey<NavigatorState> get chatKey => chatNavigation.key;
  @override
  GlobalKey<NavigatorState> get endBarKey => endBarNavigation.key;
  @override
  Future<T?> toMessage<T extends Object?>() {
    return navigationKeys.chatKey.currentState!
        .pushReplacementNamed(Chat.route, arguments: RoomEntity(name: 'Hello'));
  }
}

class NavigationKeysFactory {
  final Responsive _responsive;

  NavigationKeysFactory(this._responsive);
  NavigationKeys create() =>
      _responsive.isWebMode ? wideModeNavigationKeys : normalModeNavigationKeys;
}
*/
