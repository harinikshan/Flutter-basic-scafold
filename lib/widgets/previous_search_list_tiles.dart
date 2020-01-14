import 'package:flutter/material.dart';
import 'package:krowdforce/constants/constants.dart';

class PreviousSearchListTiles extends StatelessWidget {
  PreviousSearchListTiles({this.locationController, this.searchController});

  final TextEditingController searchController;
  final TextEditingController locationController;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.history),
      title: Text(searchController.text.isEmpty
          ? "Android Developer"
          : searchController.text),
      subtitle: Text(locationController.text),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(Icons.favorite),
          SizedBox(
            height: kSpaceBetweenTrailingWidget,
          ),
          Icon(Icons.arrow_forward_ios),
        ],
      ),
    );
  }
}
