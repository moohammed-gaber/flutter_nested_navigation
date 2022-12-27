import 'dart:math' as math;

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NestedNavigationPage(),
    );
  }
}

final Navigation navigation = Navigation();

enum TransitionType { slide, noAnimation }

class Navigation {
  final key = GlobalKey<NavigatorState>();

  Route createAnimatedRoute(Widget page,
      {TransitionType transitionType = TransitionType.noAnimation}) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        switch (transitionType) {
          case TransitionType.slide:
            const begin = Offset(0.0, 1.0);
            const end = Offset.zero;
            const curve = Curves.ease;
            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
            break;
          case TransitionType.noAnimation:
            return child;
            break;
        }
      },
    );
  }

  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Chat.route:
        return navigation.createAnimatedRoute(Chat(
          room: settings.arguments as RoomEntity,
        ));
      case IdleChat.route:
        return navigation.createAnimatedRoute(IdleChat());
      default:
    }
  }
}

class NestedNavigationPage extends StatelessWidget {
  NestedNavigationPage({Key? key}) : super(key: key);
  final rooms = List.generate(10, (index) => RoomEntity(name: '$index'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: navigation.key.currentContext!,
              builder: (x) {
                return Material(
                  child: Column(),
                  color: Colors.red,
                );
              });
        },
      ),
      body: Row(children: [
        Expanded(
          child: ListView.builder(
            itemCount: rooms.length,
            itemBuilder: (BuildContext context, int index) {
              final room = rooms[index];
              return RoomTile(room: room);
            },
          ),
        ),
        Expanded(
          child: Navigator(
            key: navigation.key,
            onGenerateRoute: navigation.onGenerateRoute,
            initialRoute: IdleChat.route,
          ),
        )
      ]),
    );
  }
}

class IdleChat extends StatelessWidget {
  static const route = '/idle';

  const IdleChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Text(
        'IDLE',
      )),
    );
  }
}

class Chat extends StatelessWidget {
  const Chat({
    Key? key,
    required this.room,
  }) : super(key: key);
  static const route = '/chat';
  final RoomEntity room;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
          .withOpacity(1.0),
      child: Center(child: Text(room.name)),
    );
  }
}

class RoomTile extends StatelessWidget {
  const RoomTile({Key? key, required this.room}) : super(key: key);
  final RoomEntity room;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(room.name),
      onTap: () => navigation.key.currentState!
          .pushReplacementNamed(Chat.route, arguments: room),
    );
  }
}

class RoomEntity {
  final String name;

  RoomEntity({required this.name});
}
