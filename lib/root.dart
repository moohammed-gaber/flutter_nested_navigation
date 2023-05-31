import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:nested_navigation/chat.dart';
import 'package:nested_navigation/controller.dart';
import 'package:nested_navigation/end_bar.dart';
import 'package:nested_navigation/entities.dart';
import 'package:nested_navigation/injection.dart';
import 'package:nested_navigation/responsive.dart';
import 'package:nested_navigation/rooms.dart';
import 'package:nested_navigation/root.dart';

class NestedNavigationPage extends StatefulWidget {
  NestedNavigationPage({Key? key}) : super(key: key);

  @override
  State<NestedNavigationPage> createState() => _NestedNavigationPageState();
}

class _NestedNavigationPageState extends State<NestedNavigationPage> {
  @override
  Widget build(BuildContext context) {
    print(responsive.isThreeBarsMode(context));
    return ValueListenableBuilder(
      valueListenable: controller,
      builder: (context, value, child) => Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                context: navigation.chatKey.currentContext!,
                builder: (x) {
                  return Material(
                    child: Column(),
                    color: Colors.red,
                  );
                });
          },
        ),
        body: Column(
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
                VerticalDivider(),
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
                Visibility(
                  child: EndBar(),
                  visible: responsive.isThreeBarsMode(context),
                )

                // EndBar()
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
