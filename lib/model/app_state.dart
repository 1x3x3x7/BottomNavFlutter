import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:my_app/core/constant/app_routes.dart';
import 'package:my_app/model/tab_state.dart';

@immutable
class AppState {
  final TabState tabState;
  final bool isLoading;
  final List<String> route;
  final Widget overviewImage;

  AppState({
    required this.tabState,
    this.isLoading = false,
    this.route = const [AppRoutes.home_screen],
    this.overviewImage = const Icon(Icons.image),
  });

  factory AppState.initial() {
    return AppState(tabState: TabState.initial(), isLoading: true);
  }

  AppState copyWith(
      {TabState? tabState,
      bool? isLoading,
      List<String>? route,
      Widget? overviewImage}) {
    return AppState(
        tabState: tabState ?? this.tabState,
        isLoading: isLoading ?? this.isLoading,
        route: route ?? this.route,
        overviewImage: overviewImage ?? this.overviewImage);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          tabState == other.tabState &&
          isLoading == other.isLoading &&
          route == other.route &&
          overviewImage == other.overviewImage;

  @override
  String toString() {
    return '${const JsonEncoder.withIndent(' ').convert(this)}';
  }

  @override
  int get hashCode =>
      tabState.hashCode ^
      isLoading.hashCode ^
      route.hashCode ^
      overviewImage.hashCode;
}
