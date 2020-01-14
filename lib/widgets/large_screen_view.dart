import 'package:flutter/material.dart';
import 'package:krowdforce/widgets/detail_screen_component.dart';

class LargeScreenView extends StatelessWidget {
  LargeScreenView({this.isLargeScreen});
  final bool isLargeScreen;

  @override
  Widget build(BuildContext context) {
    return isLargeScreen
        ? Expanded(
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(
                color: Colors.black45,
                width: 1,
              )),
              child: DetailScreenComponent(
                viewAppBar: false,
              ),
            ),
          )
        : Container();
  }
}
