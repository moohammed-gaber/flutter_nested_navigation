import 'package:flutter/material.dart';
import 'package:nested_navigation/navigation.dart';

import 'package:nested_navigation/end_bar.dart';
import 'package:nested_navigation/injection.dart';
import 'package:nested_navigation/responsive.dart';

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
        return createAnimatedRoute(const Profile());
      case IdleChatSetting.route:
        return createAnimatedRoute(const IdleChatSetting());
      case Media.route:
        return createAnimatedRoute(const Media());

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
  Widget get popButton => IconButton(onPressed: pop, icon: const Icon(Icons.cancel));
}

class NormaModeChatSettingNavigation implements IChatSettingNavigation {
  @override
  Future<T?> toMedia<T extends Object?>() {
    return materialNavigationKey.currentState!.context.to(const Media());
  }

  @override
  Widget get popButton =>
      IconButton(onPressed: pop, icon: const Icon(Icons.arrow_back_ios_new));

  @override
  Future<T?> toProfile<T extends Object?>() {
    return materialNavigationKey.currentState!.context.to(const Profile());
  }

  @override
  void pop<T extends Object?>([T? result]) {
    return materialNavigationKey.currentState!.pop();
  }
}
