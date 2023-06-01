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
                      Expanded(
                        child: Rooms(),
                      ),
                      VerticalDivider(width: 0),
                      Expanded(
                        flex: 3,
                        child: Stack(
                          alignment: AlignmentDirectional.centerEnd,
                          children: [
                            Navigator(
                              key: navigation.chatKey,
                              onGenerateRoute: navigation.onGenerateChatRoute,
                              initialRoute: IdleChat.route,
                            ),
                            Visibility(
                              child: EndBar(),
                              visible: !responsive.isThreeBarsMode(context),
                            )
                          ],
                        ),
                      ),
                      VerticalDivider(width: 0),

                      Visibility(
                        child: EndBar(),
                        visible: responsive.isThreeBarsMode(context),
                      )

                      // EndBar()
                    ]),
                  ),
                ],
              )
            : Rooms(),
      ),
    );
  }
}
