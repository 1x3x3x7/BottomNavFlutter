import 'package:my_app/model/app_state.dart';
import 'package:my_app/redux/reducer/data_reducer.dart';
import 'package:my_app/redux/reducer/loading_reducer.dart';
import 'package:my_app/redux/reducer/navigation_reducer.dart';
import 'package:my_app/redux/reducer/tab_reducer.dart';

// Combine many smaller reducers into one
AppState appReducer(AppState state, action) {
  return AppState(
      tabState: tabReducer(state.tabState, action),
      isLoading: loadingReducer(state.isLoading, action),
      route: navigationReducer(state.route, action),
      images: imageReducer(state.images, action));
}
