import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nested_navigation/chat.dart';
import 'package:nested_navigation/end_bar.dart';
import 'package:nested_navigation/injection.dart';
import 'package:nested_navigation/responsive.dart';
import 'package:nested_navigation/rooms.dart';
import 'package:universal_html/html.dart' as html;

class NestedNavigationPage extends StatefulWidget {
  NestedNavigationPage({Key? key}) : super(key: key);

  @override
  State<NestedNavigationPage> createState() => _NestedNavigationPageState();
}

class _NestedNavigationPageState extends State<NestedNavigationPage> {
  double width(BuildContext context) => 500;

  @override
  Widget build(BuildContext context) {
    final userAgent = html.window.navigator.userAgent.toString().toLowerCase();

    print(userAgent);
    print(defaultTargetPlatform);
    return ValueListenableBuilder(
      valueListenable: controller,
      builder: (context, value, child) => Scaffold(
        body: responsive.isWebMode
            ? Column(
                children: [
                  Text(
                    'Height ${context.height} - Width ${context.width}',
                    style: TextStyle(fontSize: 20),
                  ),
                  Expanded(
                    child: Row(children: [
                      SizedBox(
                        child: Rooms(),
                        width: context.width * 0.2,
                      ),
                      VerticalDivider(width: 0),
                      Expanded(
                        flex: 3,
                        child: Navigator(
                          key: wideModeChatNavigation.key,
                          onGenerateRoute:
                              wideModeChatNavigation.onGenerateRoute,
                          initialRoute: IdleChat.route,
                        ),
                      ),
                      VerticalDivider(width: 0),
                      AnimatedContainer(
                          duration: Duration(milliseconds: 200),
                          width: value.isExpanded ? context.width / 3 : 0,
                          child: ChatSetting())
                    ]),
                  ),
                ],
              )
            : Rooms(),
      ),
    );
  }
}
