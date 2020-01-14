import 'package:flutter/material.dart';
import 'package:krowdforce/constants/constants.dart';

class CustomListTile extends StatelessWidget {
  CustomListTile(
      {this.leadingWidget,
      this.subTitleWidget,
      this.titleWidget,
      this.trailingWidget,
      this.onClick,
      this.longPress,
      this.color});

  final Widget leadingWidget;
  final Widget trailingWidget;
  final Widget titleWidget;
  final Widget subTitleWidget;
  final Function onClick;
  final Function longPress;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      elevation: 5.0,
      margin: new EdgeInsets.symmetric(
          horizontal: kSpaceMarginLeftRight, vertical: 6.0),
      child: ListTile(
        onLongPress: longPress,
        onTap: onClick,
        contentPadding: EdgeInsets.symmetric(
            horizontal: kSpaceMarginLeftRight, vertical: 10.0),
        leading: leadingWidget,
//            Container(
//              padding: EdgeInsets.only(right: 12.0),
//              decoration: new BoxDecoration(
//                  border: new Border(
//                      right: new BorderSide(width: 1.0, color: Colors.white24))),
//              child: Icon(Icons.autorenew, color: Colors.white),
//            ),
        title: titleWidget,
//            Text(
//              "Introduction to Driving",
//              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//            ),
        // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

        subtitle: subTitleWidget,
//            Row(
//              children: <Widget>[
//                Icon(Icons.linear_scale, color: Colors.yellowAccent),
//                Text(" Intermediate", style: TextStyle(color: Colors.white))
//              ],
//            ),
        trailing: trailingWidget,
//            Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
      ),
    );
  }
}
