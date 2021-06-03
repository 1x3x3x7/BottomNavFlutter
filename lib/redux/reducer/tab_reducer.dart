import 'package:my_app/model/tab_state.dart';
import 'package:my_app/redux/action/actions.dart';
import 'package:redux/redux.dart';

final tabReducer = TypedReducer(_tabActionReducer);

TabState _tabActionReducer(TabState state, dynamic action) {
  if (action is ChangeTabAction) {
    return _changeTab(state, action);
  }
  return state;
}

TabState _changeTab(TabState state, dynamic action) {
  return state.copyWith(
    currentTab: action.tab,
  );
}
