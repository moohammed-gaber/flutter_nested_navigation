import 'package:nested_navigation/controller.dart';
import 'package:nested_navigation/navigation.dart';
import 'package:nested_navigation/responsive.dart';

final responsive = Responsive();
final responsiveMocking = ResponsiveMocking();
final controller = AppController();
final normalModeChatNavigation = NormalModeChatNavigation();
final normaModeChatSettingNavigation = NormaModeChatSettingNavigation();
final wideModeChatNavigation = WideModeChatNavigation();
final wideModeChatSettingNavigation = WideModeChatSettingNavigation();
final wideModeNavigationFactory = WideModeNavigationAbstractFactory();
final normalModeNavigationFactory = NormalModeNavigationAbstractFactory();
final navigationFactoryProducer = NavigationFactoryProducer(responsive);
final navigationFactory = navigationFactoryProducer.getFactory();


/*
final navigationKeys = navigationKeysFactory.create();


final wideModeNavigationKeys = WideModeNavigationKeys();
final navigationKeysFactory = NavigationKeysFactory(responsive);
final normalModeNavigationKeys = NormalModeNavigationKeys();
*/
