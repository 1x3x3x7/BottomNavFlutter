import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_app/core/constant/app_routes.dart';
import 'package:my_app/model/app_state.dart';
import 'package:my_app/redux/action/actions.dart';

class TrainingScreen extends StatelessWidget {
  TrainingScreen({required this.title});
  final title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Center(
            child: TextButton(
                child: Text("hiit"),
                onPressed: () => StoreProvider.of<AppState>(context)
                    .dispatch(NavigatePushAction(AppRoutes.overview_screen)))),
      ),
    );
  }
}
