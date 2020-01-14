import 'package:flutter/material.dart';

import 'package:krowdforce/screens/drawer_screen.dart';

class ScreenNavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: DrawerScreen(),
    );
  }
}
