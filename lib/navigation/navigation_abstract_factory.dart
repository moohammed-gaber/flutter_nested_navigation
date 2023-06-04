import 'package:flutter/material.dart';
import 'package:nested_navigation/chat.dart';
import 'package:nested_navigation/controller.dart';
import 'package:nested_navigation/end_bar.dart';
import 'package:nested_navigation/entities.dart';
import 'package:nested_navigation/injection.dart';
import 'package:nested_navigation/main.dart';
import 'package:nested_navigation/navigation/chat_navigation.dart';
import 'package:nested_navigation/navigation/chat_setting_navigation.dart';
import 'package:nested_navigation/responsive.dart';

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
