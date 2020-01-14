import 'package:flutter/material.dart';
import 'package:krowdforce/constants/app_localizations.dart';
import 'package:krowdforce/constants/constants.dart';
import 'package:krowdforce/widgets/radio_button_enum.dart';

class RadioButtonComponent extends StatelessWidget {
  RadioButtonComponent({this.radioButtonValue, this.radioButton1Tap});

  final radioButtonValue;
  final Function radioButton1Tap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.attach_file),
      title: Text(
        AppLocalizations.of(context).translate(kSubHeader),
        style: kTypographyBody1,
      ),
      trailing: Radio(
        groupValue: radioButtonValue,
        value: RadioButtonValues.radioButton1,
        onChanged: radioButton1Tap,
      ),
    );
  }
}
