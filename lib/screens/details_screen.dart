import 'package:flutter/material.dart';
import 'package:krowdforce/widgets/detail_screen_component.dart';

class CustomDetailsScreens extends StatelessWidget {
  static const id = 'custom_detail_screen';

  @override
  Widget build(BuildContext context) {
    return DetailScreenComponent(
      viewAppBar: true,
    );
  }
}
