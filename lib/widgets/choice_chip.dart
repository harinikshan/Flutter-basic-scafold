import 'package:flutter/material.dart';
import 'package:krowdforce/constants/constants.dart';
import 'package:krowdforce/widgets/snack_bar.dart';

class ChoiceChipWidget extends StatefulWidget {
  ChoiceChipWidget(this.text);

  final String text;
  @override
  _ChoiceChipWidgetState createState() => _ChoiceChipWidgetState();
}

class _ChoiceChipWidgetState extends State<ChoiceChipWidget> {
  bool selectedState = false;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(
        widget.text,
        style: kTypographyBody1,
      ),
      selected: selectedState,
      onSelected: (value) {
        setState(() {
          selectedState = value;
          final snackBar = openSnackBar(widget.text, context);
          Scaffold.of(context).showSnackBar(snackBar);
        });
      },
    );
  }
}
