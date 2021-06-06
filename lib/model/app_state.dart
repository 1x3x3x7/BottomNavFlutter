import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:my_app/core/constant/app_routes.dart';
import 'package:my_app/model/image.dart';
import 'package:my_app/model/tab_state.dart';

@immutable
class AppState {
  final TabState tabState;
  final bool isLoading;
  final List<String> route;
  final List<ImageEntity> images;

  AppState({
    required this.tabState,
    this.isLoading = false,
    this.route = const [AppRoutes.home_screen],
    this.images = const [],
  });

  factory AppState.initial() {
    return AppState(tabState: TabState.initial(), isLoading: true);
  }

  AppState copyWith(
      {TabState? tabState,
      bool? isLoading,
      List<String>? route,
      List<ImageEntity>? images}) {
    return AppState(
        tabState: tabState ?? this.tabState,
        isLoading: isLoading ?? this.isLoading,
        route: route ?? this.route,
        images: images ?? this.images);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          tabState == other.tabState &&
          isLoading == other.isLoading &&
          route == other.route &&
          images == other.images;

  @override
  String toString() {
    return '${const JsonEncoder.withIndent(' ').convert(this)}';
  }

  @override
  int get hashCode =>
      tabState.hashCode ^ isLoading.hashCode ^ route.hashCode ^ images.hashCode;
}
