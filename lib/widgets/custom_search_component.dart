import 'package:flutter/material.dart';

class CustomSearchComponent extends StatelessWidget {
  CustomSearchComponent(
      {this.controller,
      this.leadingCallBack,
      this.trailingCallBack,
      this.searchButtonCallBack,
      this.isLocationLeadingImage: false});
  final TextEditingController controller;
  final Function trailingCallBack;
  final Function leadingCallBack;
  final Function searchButtonCallBack;
  final bool isLocationLeadingImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(3)),
        color: Colors.white,
      ),
      child: ListTile(
        leading: GestureDetector(
          onTap: leadingCallBack,
          child: isLocationLeadingImage
              ? Icon(Icons.location_on)
              : Icon(Icons.arrow_back),
        ),
        trailing: GestureDetector(
          onTap: trailingCallBack,
          child: Icon(Icons.keyboard_voice),
        ),
        title: GestureDetector(
          onTap: searchButtonCallBack,
          child: Container(
            color: Colors.transparent,
            child: IgnorePointer(
              child: TextField(
                controller: controller,
                readOnly: true,
                decoration: InputDecoration(
                  hintText: 'Enter keyword',
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
