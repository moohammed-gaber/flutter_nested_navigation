import 'package:flutter/material.dart';
import 'package:nested_navigation/chat.dart';
import 'package:nested_navigation/entities.dart';
import 'package:nested_navigation/injection.dart';

class Rooms extends StatelessWidget {
  Rooms({Key? key}) : super(key: key);
  final rooms = List.generate(10, (index) => RoomEntity(name: '$index'));

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: rooms.length,
      itemBuilder: (BuildContext context, int index) {
        final room = rooms[index];
        return RoomTile(room: room);
      },
    );
  }
}

class RoomTile extends StatelessWidget {
  RoomTile({Key? key, required this.room}) : super(key: key);
  final RoomEntity room;
  final avatar = CircleAvatar(
      backgroundImage: NetworkImage(
          'https://t3.ftcdn.net/jpg/02/00/90/24/360_F_200902415_G4eZ9Ok3Ypd4SZZKjc8nqJyFVp1eOD6V.jpg'));

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: avatar,
      title: Text('Simple Room', maxLines: 1, overflow: TextOverflow.ellipsis),
      subtitle:
          Text('Simple message', maxLines: 1, overflow: TextOverflow.ellipsis),
      onTap: () => navigationFactory.chatNavigation.toChat(),
    );
  }
}
