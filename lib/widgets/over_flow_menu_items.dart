import 'package:flutter/material.dart';

Widget overFlowMenuItems() {
  return PopupMenuButton(
    itemBuilder: (context) {
      var list = List<PopupMenuEntry>();
      list.add(PopupMenuItem(
        child: Text("settings"),
        value: 1,
      ));
      list.add(PopupMenuItem(
        child: Text("profile"),
        value: 2,
      ));
      return list;
    },
  );
}
