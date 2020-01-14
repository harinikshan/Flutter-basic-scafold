import 'package:flutter/material.dart';
import 'package:krowdforce/constants/app_localizations.dart';
import 'package:krowdforce/constants/constants.dart';
import 'package:krowdforce/widgets/custom_list_tiles_widget.dart';
import 'package:krowdforce/widgets/large_screen_view.dart';

class BulkSelectionListScreen extends StatefulWidget {
  static const id = "navigation_screen_2";
  BulkSelectionListScreen({this.floatingButtonClick});

  final Function floatingButtonClick;

  @override
  _BulkSelectionListScreenState createState() =>
      _BulkSelectionListScreenState();
}

class _BulkSelectionListScreenState extends State<BulkSelectionListScreen> {
  var selectedValue = 0;
  var isLargeScreen = false;
  int count = 0;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: OrientationBuilder(
          builder: (context, orientation) {
            if (MediaQuery.of(context).size.width > 600) {
              isLargeScreen = true;
            } else {
              isLargeScreen = false;
            }

            return Row(
              children: <Widget>[
                Expanded(
                  child: Scrollbar(
                    child: ItemListView(
                      selectCountCallback: (count) {
                        setState(() {
                          this.count = count;
                          print(
                              '${AppLocalizations.of(context).translate(kValue)} ${this.count}');
                        });

                        widget.floatingButtonClick(count);
                      },
                    ),
                  ),
                ),
                LargeScreenView(
                  isLargeScreen: isLargeScreen,
                ),
              ],
            );
          },
        ));
  }
}

class ItemListView extends StatefulWidget {
  ItemListView({this.selectCountCallback});

  final Function selectCountCallback;

  @override
  _ItemListViewState createState() => _ItemListViewState();
}

class _ItemListViewState extends State<ItemListView> {
  int countValue = 0;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return ItemList(
            longPressCallBack: (value) {
              setState(() {
                value ? countValue-- : countValue++;
              });

              widget.selectCountCallback(countValue);
            },
          );
        });
  }
}

class ItemList extends StatefulWidget {
  ItemList({this.longPressCallBack});

  final Function longPressCallBack;
  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  var longPressed = false;
  @override
  Widget build(BuildContext context) {
    return CustomListTile(
      color: longPressed ? kColorSelectedList : null,
      onClick: () {},
      longPress: () {
        widget.longPressCallBack(longPressed);
        setState(() {
          longPressed = !longPressed;
        });

//              longPressed = !longPressed;
      },
      trailingWidget: longPressed
          ? Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  radius: kSizeCircleRadius,
                  child: Icon(
                    Icons.check,
                    size: kSizeIcon,
                  ),
                ),
              ],
            )
          : null,
    );
  }
}
