import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:krowdforce/constants/constants.dart';

void materialBottomSheet(BuildContext context) {
  showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: kSpaceMarginLeftRight),
//          height: 300,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Flexible(
                child: ListTile(
                  onTap: () {
                    Share.share('check out my website https://example.com');
                    Navigator.pop(context);
                  },
                  leading: Icon(Icons.share),
                  title: Text('Subheader'),
                ),
              ),
              Flexible(
                child: ListTile(
                  onTap: () {},
                  leading: Icon(Icons.cloud_download),
                  title: Text('Subheader'),
                ),
              ),
              Flexible(
                child: ListTile(
                  onTap: () {},
                  leading: Icon(Icons.content_copy),
                  title: Text('Subheader'),
                ),
              ),
              Flexible(
                child: ListTile(
                  onTap: () {},
                  leading: Icon(Icons.print),
                  title: Text('Subheader'),
                ),
              ),
            ],
          ),
        );
      });
}
