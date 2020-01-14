import 'package:flutter/cupertino.dart';

class CupertinoListDesign extends StatelessWidget {
  CupertinoListDesign({this.icon, this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
    );
  }
}
