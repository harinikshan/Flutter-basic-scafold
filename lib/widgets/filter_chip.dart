import 'package:flutter/material.dart';
import 'package:krowdforce/constants/constants.dart';

class FilterChipWidget extends StatefulWidget {
  FilterChipWidget(this.text);

  final String text;
  @override
  _FilterChipWidgetState createState() => _FilterChipWidgetState();
}

class _FilterChipWidgetState extends State<FilterChipWidget> {
  bool selectedState = false;
  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(
        widget.text,
        style: kTypographyBody1,
      ),
      selected: selectedState,
      onSelected: (value) {
        setState(() {
          selectedState = value;
        });
      },
    );
  }
}
