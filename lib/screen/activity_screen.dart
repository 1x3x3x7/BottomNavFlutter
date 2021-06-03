import 'package:flutter/material.dart';

class ActivityScreen extends StatelessWidget {
  ActivityScreen({required this.title});
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
            child: Text(title),
          ),
        ));
  }
}
