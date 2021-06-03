import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_app/model/app_state.dart';
import 'package:my_app/model/tab_state.dart';
import 'package:my_app/redux/action/actions.dart';
import 'package:my_app/screen/activity_screen.dart';
import 'package:my_app/screen/profile_screen.dart';
import 'package:my_app/model/tab_item.dart';
import 'package:my_app/screen/training_screen.dart';
import 'package:redux/redux.dart';

class BottomNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector(
      converter: (Store<AppState> store) => _ViewModel.fromStore(store),
      builder: (BuildContext context, _ViewModel viewModel) {
        return Scaffold(
          body: IndexedStack(
            index: viewModel.tabState.currentTab.index,
            children: [
              TrainingScreen(title: tabName[viewModel.tabState.currentTab]),
              ActivityScreen(title: tabName[viewModel.tabState.currentTab]),
              ProfileScreen(title: tabName[viewModel.tabState.currentTab]),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Theme.of(context).primaryColor,
            unselectedItemColor: Colors.grey,
            type: BottomNavigationBarType.fixed,
            currentIndex: viewModel.tabState.currentTab.index,
            items: [
              _buildItem(TabItem.training),
              _buildItem(TabItem.activity),
              _buildItem(TabItem.profile),
            ],
            onTap: viewModel.changeTab,
          ),
        );
      },
    );
  }

  BottomNavigationBarItem _buildItem(TabItem tabItem) {
    return BottomNavigationBarItem(
      icon: Icon(tabIcon[tabItem]),
      label: tabName[tabItem],
    );
  }
}

class _ViewModel {
  final TabState tabState;
  final void Function(int) changeTab;

  const _ViewModel({required this.tabState, required this.changeTab});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      tabState: store.state.tabState,
      changeTab: (index) => store.dispatch(
        ChangeTabAction(TabItem.values[index]),
      ),
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _ViewModel &&
          runtimeType == other.runtimeType &&
          tabState == other.tabState;

  @override
  int get hashCode => tabState.hashCode;
}
