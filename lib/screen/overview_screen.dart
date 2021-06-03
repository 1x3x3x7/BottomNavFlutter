import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_app/model/app_state.dart';
import 'package:my_app/redux/action/actions.dart';
import 'package:redux/redux.dart';

class OverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Store<AppState> store = StoreProvider.of<AppState>(context);
    store.dispatch(loadOverviewImageAction(store));
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Overview",
          ),
        ),
        body: Container(
          color: Colors.white,
          child: Column(children: [
            Container(
              child: StoreConnector<AppState, AppState>(
                converter: (store) => store.state,
                builder: (context, vm) => vm.overviewImage,
              ),
              alignment: Alignment.topCenter,
            ),
            SizedBox(
              height: 50,
            ),
            TextButton(
                child: Text("alert"),
                onPressed: () => showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: Text("alert"),
                        content: Text("text"),
                      ),
                    )),
          ]),
        ));
  }
}
