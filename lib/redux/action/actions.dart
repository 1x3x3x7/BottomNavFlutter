import 'package:flutter/material.dart';
import 'package:my_app/model/tab_item.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

class NavigateReplaceAction {
  final String routeName;

  NavigateReplaceAction(this.routeName);

  @override
  String toString() {
    return 'NavigateReplaceAction{routeName: $routeName}';
  }
}

class NavigatePushAction {
  final String routeName;

  NavigatePushAction(this.routeName);

  @override
  String toString() {
    return 'NavigatePushAction{routeName: $routeName}';
  }
}

class NavigatePopAction {
  @override
  String toString() {
    return 'NavigatePopAction';
  }
}

class ChangeTabAction {
  final TabItem tab;

  ChangeTabAction(this.tab);

  @override
  String toString() {
    return 'ChangeTabAction{tab: $tab}';
  }
}

class GetImageAction {
  @override
  String toString() {
    return 'GetImageAction';
  }
}

class LoadedImageAction {
  final Widget widget;

  LoadedImageAction(this.widget);

  @override
  String toString() {
    return 'LoadedImageAction{widget: $widget}';
  }
}

ThunkAction loadOverviewImageAction = (Store store) async {
  store.dispatch(GetImageAction());
  _loadImage(
          "https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=2100&q=80")
      .then((image) => store.dispatch(LoadedImageAction(image)));
};

Future<Widget> _loadImage(String url) async {
  //await Future.delayed(Duration(seconds: 5));
  return Image.network(url);
}
