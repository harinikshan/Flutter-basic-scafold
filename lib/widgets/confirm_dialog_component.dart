import 'package:flutter/material.dart';
import 'package:krowdforce/constants/app_localizations.dart';
import 'package:krowdforce/constants/constants.dart';

Widget confirmDialogComponent(BuildContext context) {
  return Container(
    padding: EdgeInsets.all(kSpaceMarginLeftRight),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              AppLocalizations.of(context).translate(kTitle),
              style: kTypographyHeadline6,
            ),
            Text(
              AppLocalizations.of(context).translate(kCaption),
              style: kTypographyBody1,
            ),
            SizedBox(
              height: kSpaceVerticalInnerComponentPadding,
            ),
            Text(
              'dhs ssjcbdj cdc dhiicieidhied uducucbsjc ucusc dhs ssjcbdj cdc dhiicieidhied uducucbsjc ucusc dhs ssjcbdj cdc dhiicieidhied uducucbsjc ucusc dhs ssjcbdj cdc dhiicieidhied uducucbsjc ucusc',
              style: kTypographyBody1,
            ),
          ],
        ),
        SizedBox(
          height: kSpaceVerticalInnerComponentPadding,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FlatButton(
              onPressed: () {},
              child: Text(
                AppLocalizations.of(context).translate(kCancel).toUpperCase(),
                style: kTypographyButton,
              ),
            ),
            FlatButton(
              onPressed: () {},
              child: Text(
                  AppLocalizations.of(context).translate(kOk).toUpperCase(),
                  style: kTypographyButton),
            ),
          ],
        ),
      ],
    ),
  );
}
