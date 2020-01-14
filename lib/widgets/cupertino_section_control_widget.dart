import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class IosSegmentNavigation extends StatelessWidget {
  IosSegmentNavigation({
    this.onValueChanged,
    this.selectedValue,
    this.titleList,
    this.screenList,
  });

  final Function onValueChanged;
  final int selectedValue;
  final List<Widget> titleList;
  final List<Widget> screenList;

  @override
  Widget build(BuildContext context) {
    Map convertion() {
      Map data = Map<int, Widget>();
      for (int i = 0; i < titleList.length; i++) {
        data[i] = titleList[i];
      }
      return data;
    }

    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          CupertinoSegmentedControl(
            children: convertion(),
            groupValue: selectedValue,
            onValueChanged: onValueChanged,
          ),
          Expanded(child: screenList[selectedValue]),
        ],
      ),
    );
  }
}
