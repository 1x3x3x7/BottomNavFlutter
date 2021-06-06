import 'package:flutter/material.dart';
import 'package:my_app/model/app_state.dart';
import 'package:my_app/model/image.dart';
import 'package:my_app/redux/action/actions.dart';
import 'package:redux/redux.dart';

Reducer<List<ImageEntity>> imageReducer =
    combineReducers([TypedReducer(_addImagesReducer)]);

List<ImageEntity> _addImagesReducer(
        List<ImageEntity> items, AddImagesAction action) =>
    action.items;
