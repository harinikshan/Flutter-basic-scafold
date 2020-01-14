import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:share/share.dart';
import 'package:krowdforce/widgets/cupertino_list_design.dart';

void cupertinoBottomSheet(BuildContext context) {
  showCupertinoModalPopup(
    context: context,
    builder: (context) {
      return CupertinoActionSheet(
        cancelButton: CupertinoActionSheetAction(
          child: Text('cancel'),
          isDefaultAction: true,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          CupertinoActionSheetAction(
            onPressed: () {
              Share.share('check out my website https://example.com');
              Navigator.pop(context);
            },
            child: CupertinoListDesign(
              text: 'Share',
            ),
          ),
          CupertinoActionSheetAction(
            onPressed: () {},
            child: CupertinoListDesign(
              text: 'Cloud download',
            ),
          ),
          CupertinoActionSheetAction(
            onPressed: () {},
            child: CupertinoListDesign(
              text: 'Content copy',
            ),
          ),
          CupertinoActionSheetAction(
            onPressed: () {},
            child: CupertinoListDesign(
              text: 'Print',
            ),
          ),
        ],
      );
    },
  );
}
