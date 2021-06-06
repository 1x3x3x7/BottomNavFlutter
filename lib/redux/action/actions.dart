import 'package:flutter/material.dart';
import 'package:my_app/model/app_state.dart';
import 'package:my_app/model/image.dart';
import 'package:my_app/model/tab_item.dart';
import 'package:my_app/network/api_client.dart';
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

class AddImagesAction {
  final List<ImageEntity> items;

  AddImagesAction(this.items);

  @override
  String toString() {
    return 'AddImagesAction{items: $items}';
  }
}

ThunkAction<AppState> fetchItemAction() {
  return (Store<AppState> store) async {
    ApiClient().fetchImages().then(
          (items) => store.dispatch(
            AddImagesAction(items),
          ),
        );
  };
}
