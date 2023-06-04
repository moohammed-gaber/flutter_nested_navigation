import 'package:nested_navigation/controller.dart';
import 'package:nested_navigation/navigation/chat_navigation.dart';
import 'package:nested_navigation/navigation/chat_setting_navigation.dart';
import 'package:nested_navigation/navigation/navigation_abstract_factory.dart';
import 'package:nested_navigation/responsive.dart';

final responsive = Responsive();
final controller = AppController();
final normalModeChatNavigation = NormalModeChatNavigation();
final normaModeChatSettingNavigation = NormaModeChatSettingNavigation();
final wideModeChatNavigation = WideModeChatNavigation();
final wideModeChatSettingNavigation = WideModeChatSettingNavigation();
final wideModeNavigationFactory = WideModeNavigationAbstractFactory();
final normalModeNavigationFactory = NormalModeNavigationAbstractFactory();
final navigationFactoryProducer = NavigationFactoryProducer(responsive);
final navigationFactory = navigationFactoryProducer.getFactory();
