import 'package:my_app/model/app_state.dart';
import 'package:my_app/redux/action/actions.dart';
import 'package:redux/redux.dart';

import '../main.dart';

List<Middleware<AppState>> createNavigationMiddleware() {
  return [
    TypedMiddleware<AppState, NavigateReplaceAction>(_navigateReplace),
    TypedMiddleware<AppState, NavigatePushAction>(_navigate),
  ];
}

_navigateReplace(Store<AppState> store, action, NextDispatcher next) {
  final routeName = (action as NavigateReplaceAction).routeName;
  if (store.state.route.last != routeName) {
    navigatorKey.currentState?.pushReplacementNamed(routeName);
  }
  next(action); //This need to be after name checks
}

_navigate(Store<AppState> store, action, NextDispatcher next) {
  final routeName = (action as NavigatePushAction).routeName;
  if (store.state.route.last != routeName) {
    navigatorKey.currentState?.pushNamed(routeName);
  }
  next(action); //This need to be after name checks
}
