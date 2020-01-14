import 'package:flutter/material.dart';
import 'package:krowdforce/bloc/theme.dart';
import 'package:krowdforce/constants/app_localizations.dart';
import 'package:krowdforce/constants/constants.dart';
import 'package:krowdforce/screens/bulk_action_screen.dart';
import 'package:krowdforce/screens/font_style_screen.dart';
import 'package:krowdforce/screens/list_detail_view_navigation_screen.dart';
import 'package:provider/provider.dart';

class DrawerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text(
                  'Hari prasath',
                  style: kTypographyHeadline6,
                ),
                accountEmail: Text(
                  'embassy tech village banglaore',
                  style: kTypographyBody2,
                ),
                currentAccountPicture: CircleAvatar(
                    child: Image(
                        image: AssetImage('assets/images/sample_image.png'))),
              ),
              DrawerList(
                text: AppLocalizations.of(context)
                    .translate(kDesign_screen_title),
                onclick: () {
                  navigateScreens(context, StyleScreen.id);
                },
              ),
              DrawerList(
                text: AppLocalizations.of(context)
                    .translate(kNavigation_screen_title),
                onclick: () {
                  navigateScreens(context, ListDetailViewNavigationScreen.id);
                },
              ),
              DrawerList(
                text: AppLocalizations.of(context)
                    .translate(kBulk_action_screen_title),
                onclick: () {
                  navigateScreens(context, BulkActionScreen.id);
                },
              ),
              DrawerList(
                text: "Dark theme",
                onclick: () {
                  theme.isDarkThemeData(true);
                },
              ),
              DrawerList(
                text: "Light theme",
                onclick: () {
                  theme.isDarkThemeData(false);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

void navigateScreens(BuildContext context, String screen) {
  Navigator.pushNamed(context, screen);
}

class DrawerList extends StatelessWidget {
  DrawerList({this.text, this.onclick});

  final String text;
  final Function onclick;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onclick,
      title: (Text(
        text,
        style: kTypographyBody2,
      )),
    );
  }
}
