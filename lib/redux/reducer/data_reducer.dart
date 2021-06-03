import 'package:flutter/material.dart';
import 'package:my_app/redux/action/actions.dart';
import 'package:redux/redux.dart';

Reducer<Widget> imageReducer = combineReducers(
    [TypedReducer(_getImageReducer), TypedReducer(_loadedImageReducer)]);

Widget _getImageReducer(Widget widget, GetImageAction action) =>
    Center(child: CircularProgressIndicator());

Widget _loadedImageReducer(Widget widget, LoadedImageAction action) =>
    action.widget;
