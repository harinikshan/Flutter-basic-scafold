import 'package:flutter/material.dart';
import 'package:krowdforce/constants/constants.dart';
import 'package:krowdforce/widgets/confirm_dialog_component.dart';
import 'package:krowdforce/constants/app_localizations.dart';
import 'package:krowdforce/widgets/screen_navigation_drawer.dart';

enum localizationKey { first_string, second_string }

//Defines the style screen
class StyleScreen extends StatelessWidget {
  static const id = 'style_Screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context).translate(kDesign_screen_title),
          style: kTypographyTitle,
        ),
      ),
      drawer: ScreenNavigationDrawer(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: kSpaceMarginLeftRight),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            StyleElements(
              title: 'displayname 3',
              style: kTypographyDisplay3,
              fontNameSize: 'Regular 56 sp',
            ),
            StyleElements(
              title: 'displayname 2',
              style: kTypographyDisplay2,
              fontNameSize: 'Regular 45 sp',
            ),
            StyleElements(
              title: 'displayname 1',
              style: kTypographyDisplay1,
              fontNameSize: 'Regular 34 sp',
            ),
            StyleElements(
              title: 'headline',
              style: kTypographyHeadline,
              fontNameSize: 'Regular 24 sp',
            ),
            StyleElements(
              title: 'title',
              style: kTypographyTitle,
              fontNameSize: 'medium 20 sp',
            ),
            StyleElements(
              title: 'subheading',
              style: kTypographySubhead,
              fontNameSize: 'Regular 16 sp',
            ),
            StyleElements(
              title: 'body 2',
              style: kTypographyBody2,
              fontNameSize: 'medium 14 sp',
            ),
            StyleElements(
              title: 'body 1',
              style: kTypographyBody1,
              fontNameSize: 'Regular 14 sp',
            ),
            StyleElements(
              title: 'caption',
              style: kTypographyCaption,
              fontNameSize: 'Regular 12 sp',
            ),
            StyleElements(
              title: 'button',
              style: kTypographyButton,
              fontNameSize: 'medium 14 sp'.toUpperCase(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return confirmDialogComponent(context);
              });
        },
      ),
    );
  }
}

class StyleElements extends StatelessWidget {
  StyleElements({this.style, this.title, this.fontNameSize});

  final TextStyle style;
  final String title;
  final String fontNameSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: kSpaceVerticalInnerComponentPadding,
        ),
        Text(title, style: kTypographyCaption),
        SizedBox(
          width: kSpaceVerticalInnerComponentPadding,
        ),
        Flexible(
          child: Text(
            fontNameSize,
            style: style,
          ),
        ),
      ],
    );
  }
}
