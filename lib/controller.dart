import 'package:flutter/foundation.dart';

class AppState {
  final bool isExpanded;

  const AppState({
    required this.isExpanded,
  });
  factory AppState.initial() => AppState(isExpanded: false);

  AppState copyWith({
    bool? isExpanded,
  }) {
    return AppState(
      isExpanded: isExpanded ?? this.isExpanded,
    );
  }
}

class AppController extends ValueNotifier<AppState> {
  AppController() : super(AppState.initial());

  void toggleExpand() {
    value = value.copyWith(isExpanded: !value.isExpanded);
  }

  void collapse() {
    value = value.copyWith(isExpanded: false);
  }

  void expand() {
    value = value.copyWith(isExpanded: true);
  }
}
