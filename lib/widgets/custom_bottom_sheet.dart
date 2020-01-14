import 'package:flutter/material.dart';
import 'package:krowdforce/constants/constants.dart';

Widget customBottomSheet(BuildContext context, int count) {
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
              'Confirm job award',
              style: kTypographyHeadline,
            ),
            Text(
              '$count selected',
              style: kTypographySubhead,
            ),
          ],
        ),
        Expanded(
          child: ListView.builder(
              itemCount: count,
              itemBuilder: (context, index) {
                return Column(
                  children: <Widget>[
                    ListTile(
                      leading: CircleAvatar(child: Icon(Icons.home)),
                      title: Text(
                        'Hari prasath',
                        style: kTypographyTitle,
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.thumb_up),
                        onPressed: () {},
                      ),
                    ),
                    Container(
                      child: Divider(
                        height: 20,
                      ),
                    ),
                  ],
                );
              }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'.toUpperCase()),
            ),
            FlatButton(
              onPressed: () {},
              child: Text('Ok'.toUpperCase()),
            ),
          ],
        ),
      ],
    ),
  );
}
