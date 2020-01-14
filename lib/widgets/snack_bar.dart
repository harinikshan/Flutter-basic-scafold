import 'package:flutter/material.dart';
import 'package:krowdforce/constants/app_localizations.dart';
import 'package:krowdforce/constants/constants.dart';

SnackBar openSnackBar(String value, BuildContext context) {
  return SnackBar(
    duration: Duration(seconds: kSnackBarDuration),
    content: (Text(
      value,
      style: kTypographyTitle,
    )),
    action: SnackBarAction(
      label: AppLocalizations.of(context).translate(kUndo).toUpperCase(),
      onPressed: () {},
    ),
  );
}
