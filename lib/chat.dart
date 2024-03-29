import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:nested_navigation/entities.dart';
import 'package:nested_navigation/injection.dart';

class IdleChat extends StatelessWidget {
  static const route = '/idle';

  const IdleChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
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
    return Scaffold(
      appBar: AppBar(
          title: GestureDetector(
              onTap: navigationFactory.chatSettingNavigation.toProfile,
              child: const Text('Mohamed Gaber'))),
      backgroundColor: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
          .withOpacity(1.0),
      body: Center(child: Text(room.name)),
    );
  }
}
