import 'package:flutter/material.dart';

enum TabItem { training, activity, profile }

const Map<TabItem, String> tabName = {
  TabItem.training: 'Training',
  TabItem.activity: 'Activity',
  TabItem.profile: 'Profile',
};

const Map<TabItem, IconData> tabIcon = {
  TabItem.training: Icons.home,
  TabItem.activity: Icons.calendar_today,
  TabItem.profile: Icons.person,
};
