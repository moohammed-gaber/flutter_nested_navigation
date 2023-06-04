
import 'package:flutter/material.dart';
import 'package:nested_navigation/navigation.dart';
import 'package:nested_navigation/root.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: materialNavigationKey,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const NestedNavigationPage(),
    );
  }
}



/*
          child: Column(children: [
            Row(children: [
              IconButton(
                  onPressed: controller.toggleExpand,
                  icon: Icon(Icons.cancel))
            ]),
          ]),
*/

/*
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: AnimatedContainer(
                      width: value.isExpanded ? 700 : 0,
                      child: Column(children: [
                        Row(children: [
                          IconButton(
                              onPressed: controller.toggleExpand,
                              icon: Icon(Icons.cancel))
                        ]),
                      ]),
                      color: Colors.green,
                      duration: Duration(milliseconds: 700)),
                ),
*/


