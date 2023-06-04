import 'package:flutter/material.dart';
import 'package:nested_navigation/injection.dart';

class Profile extends StatelessWidget {
  static const route = '/profile';

  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListTile(
        // leading: Icon(Icons.attachment, size: 20),
        title: const Text(
          'Media',
        ),
        onTap: navigationFactory.chatSettingNavigation.toMedia,
      ),
      appBar: AppBar(
          title: const Text('Contact Info'),
          leading: navigationFactory.chatSettingNavigation.popButton),
    );
  }
}

class IdleChatSetting extends StatelessWidget {
  static const route = '/idle-end-bar';

  const IdleChatSetting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 0,
      height: 0,
    );
  }
}

class ChatSetting extends StatelessWidget {
  const ChatSetting({Key? key}) : super(key: key);
  double width(BuildContext context) =>
      responsive.isThreeBarsMode(context) ? 500 : 2000;
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: wideModeChatSettingNavigation.key,
      onGenerateRoute: wideModeChatSettingNavigation.onGenerateRoute,
      initialRoute: IdleChatSetting.route,
    );
    return ValueListenableBuilder(
        valueListenable: controller,
        builder: (context, value, child) => AnimatedContainer(
            width: value.isExpanded ? width(context) : 0,
            color: Colors.green,
            duration: const Duration(milliseconds: 200),
            child: Navigator(
              key: wideModeChatSettingNavigation.key,
              onGenerateRoute: wideModeChatSettingNavigation.onGenerateRoute,
              initialRoute: Profile.route,
            )));
  }
}

class Media extends StatelessWidget {
  const Media({Key? key}) : super(key: key);
  static const route = '/media';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Media')),
    );
  }
}
