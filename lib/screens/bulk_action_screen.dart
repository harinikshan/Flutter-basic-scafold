import 'package:flutter/material.dart';
import 'package:krowdforce/constants/app_localizations.dart';
import 'package:krowdforce/constants/constants.dart';
import 'package:krowdforce/screens/place_holder_screen.dart';
import 'package:krowdforce/widgets/android_tab_navigation_widget.dart';
import 'package:krowdforce/widgets/custom_bottom_sheet.dart';
import 'package:krowdforce/widgets/screen_navigation_drawer.dart';

import 'bulk_selection_list_screen.dart';

class BulkActionScreen extends StatefulWidget {
  static const String id = 'bulk_action_screen';

  @override
  _BulkActionScreenState createState() => _BulkActionScreenState();
}

class _BulkActionScreenState extends State<BulkActionScreen>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  var iosSelectedValue = 0;
  var value = 0;
  Function floatingButtonClick;
  bool snackBarVisible = false;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var tabTitleList = <Widget>[
      Text(
        'ITEM 1',
        style: kTypographyButton,
      ),
      Text('ITEM 2', style: kTypographyButton),
      Text('ITEM 3', style: kTypographyButton),
    ];

    var tabScreenList = <Widget>[
      BulkSelectionListScreen(
        floatingButtonClick: (count) {
          setState(() {
            value = count;
            snackBarVisible = true;
          });
          value = count;
          print('$count');
        },
      ),
      PlaceHolderScreen(),
      PlaceHolderScreen(),
    ];

    return Scaffold(
      drawer: ScreenNavigationDrawer(),
      appBar: AppBar(
        title: Text(
            AppLocalizations.of(context).translate(kBulk_action_screen_title)),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
          itemPopup(),
        ],
      ),
      bottomNavigationBar: snackBarVisible
          ? CustomSnackBar(
              value: value,
              dismissButtonClick: () {
                setState(() {
                  snackBarVisible = false;
                });
              },
            )
          : null,
      body: AndroidTabNavigation(
        tabController: tabController,
        titleList: tabTitleList,
        screenList: tabScreenList,
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return customBottomSheet(context, value);
                });
          }),
    );
  }
}

class CustomSnackBar extends StatelessWidget {
  CustomSnackBar({this.value, this.dismissButtonClick});

  final value;
  final Function dismissButtonClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF323232),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: kSpaceHorizontalInnerComponentPadding),
              child: GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return customBottomSheet(context, value);
                      });
                },
                child: Text(
                  '$value ${AppLocalizations.of(context).translate(kSelected)}',
                  style: kTypographyBody2.copyWith(color: Colors.white),
                ),
              ),
            ),
            FlatButton(
              child: Text(
                AppLocalizations.of(context).translate(kDismiss).toUpperCase(),
                style: kTypographyButton.copyWith(color: Colors.white),
              ),
              onPressed: dismissButtonClick,
            ),
          ],
        ),
      ),
    );
  }
}

Widget itemPopup() {
  return PopupMenuButton(
    itemBuilder: (context) {
      var list = List<PopupMenuEntry>();
      list.add(PopupMenuItem(
        child: Text(AppLocalizations.of(context).translate(kSettings)),
        value: 1,
      ));
      list.add(PopupMenuItem(
        child: Text(AppLocalizations.of(context).translate(kProfile)),
        value: 2,
      ));
      return list;
    },
  );
}
