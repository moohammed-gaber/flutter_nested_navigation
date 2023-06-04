import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nested_navigation/chat.dart';
import 'package:nested_navigation/end_bar.dart';
import 'package:nested_navigation/injection.dart';
import 'package:nested_navigation/responsive.dart';
import 'package:nested_navigation/rooms.dart';

class NestedNavigationPage extends StatefulWidget {
  const NestedNavigationPage({Key? key}) : super(key: key);

  @override
  State<NestedNavigationPage> createState() => _NestedNavigationPageState();
}

class _NestedNavigationPageState extends State<NestedNavigationPage> {
  double width(BuildContext context) {
    if (context.width < 570) {
      return context.width * 0.8;
    }
    if (context.width < 1200) {
      return context.width / 3;
    } else {
      return context.width / 4;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller,
      builder: (context, value, child) => Scaffold(
        body: responsive.isWebMode
            ? Column(
                children: [
                  Text(
                    'Height ${context.height} - Width ${context.width}',
                    style: const TextStyle(fontSize: 20),
                  ),
                  Expanded(
                    child: Row(children: [
                      SizedBox(
                        width: context.width * 0.2,
                        child: Rooms(),
                      ),
                      const VerticalDivider(width: 0),
                      Expanded(
                        flex: 3,
                        child: Navigator(
                          key: wideModeChatNavigation.key,
                          onGenerateRoute:
                              wideModeChatNavigation.onGenerateRoute,
                          initialRoute: IdleChat.route,
                        ),
                      ),
                      const VerticalDivider(width: 0),
                      AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          width: value.isExpanded ? width(context) : 0,
                          child: const ChatSetting())
                    ]),
                  ),
                ],
              )
            : Rooms(),
      ),
    );
  }
}
