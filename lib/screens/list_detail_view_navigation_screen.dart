import 'package:flutter/material.dart';
import 'package:krowdforce/constants/constants.dart';
import 'package:krowdforce/constants/app_localizations.dart';
import 'package:krowdforce/screens/list_detail_view_screen.dart';
import 'package:krowdforce/widgets/android_tab_navigation_widget.dart';
import 'package:krowdforce/widgets/over_flow_menu_items.dart';
import 'package:krowdforce/widgets/screen_navigation_drawer.dart';

import 'place_holder_screen.dart';

var tabTitleList = <Widget>[
  Text('TAB 1'),
  Text('TAB 2'),
  Text('TAB 3'),
];

var tabScreenList = <Widget>[
  ListDetailViewScreen(phoneListData),
  PlaceHolderScreen(),
  PlaceHolderScreen(),
];

List<Widget> phoneListData = [
  Text(
    'APPLE',
    style: kTypographyTitle,
  ),
  Text(
    'NEXUS',
    style: kTypographyTitle,
  ),
  Text(
    'MI',
    style: kTypographyTitle,
  ),
  Text(
    'PIXEL',
    style: kTypographyTitle,
  ),
  Text(
    'SAMSUNG',
    style: kTypographyTitle,
  ),
  Text(
    'REALME',
    style: kTypographyTitle,
  ),
];

class ListDetailViewNavigationScreen extends StatefulWidget {
  static const id = 'navigation_screen';

  @override
  _ListDetailViewNavigationScreenState createState() =>
      _ListDetailViewNavigationScreenState();
}

class _ListDetailViewNavigationScreenState
    extends State<ListDetailViewNavigationScreen>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  var iosSelectedValue = 0;

  @override
  void initState() {
    // TODO: implement initState
    tabController = TabController(length: tabTitleList.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: ScreenNavigationDrawer(),
      appBar: AppBar(
        title: Text(
            AppLocalizations.of(context).translate('navigation_screen_title')),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
            ),
          ),
          overFlowMenuItems(),
        ],
      ),
      body: AndroidTabNavigation(
        tabController: tabController,
        titleList: tabTitleList,
        screenList: tabScreenList,
      ),
    );
  }
}
