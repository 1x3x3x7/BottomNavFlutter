import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:my_app/model/tab_item.dart';

@immutable
class TabState {
  final TabItem currentTab;

  const TabState({required this.currentTab});

  factory TabState.initial() => const TabState(currentTab: TabItem.training);

  TabState copyWith({TabItem? currentTab}) {
    return TabState(
      currentTab: currentTab ?? this.currentTab,
    );
  }

  dynamic toJson() => {
        'currentTab': currentTab,
      };

  @override
  String toString() {
    return '${const JsonEncoder.withIndent(' ').convert(this)}';
  }
}
