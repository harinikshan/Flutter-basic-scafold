import 'package:flutter/material.dart';
import 'package:krowdforce/constants/constants.dart';
import 'package:krowdforce/widgets/custom_list_tiles_widget.dart';
import 'package:krowdforce/widgets/large_screen_view.dart';
import 'details_screen.dart';

class ListDetailViewScreen extends StatefulWidget {
  static const id = "navigation_screen_1";

  ListDetailViewScreen(this.screenDataList);

  final List<Widget> screenDataList;

  @override
  _ListDetailViewScreenState createState() => _ListDetailViewScreenState();
}

class _ListDetailViewScreenState extends State<ListDetailViewScreen> {
  var selectedValue = 0;
  var isLargeScreen = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: OrientationBuilder(
        builder: (context, orientation) {
          if (MediaQuery.of(context).size.width > kScreenThresholdSize) {
            isLargeScreen = true;
          } else {
            isLargeScreen = false;
          }

          return Row(
            children: <Widget>[
              Expanded(
                child: ItemsListView(
                  dataList: widget.screenDataList,
                  onPressCallBack: (index) {
                    setState(() {
                      selectedValue = index;
                    });

                    if (isLargeScreen) {
                      print('clicked$index');
                    } else {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return CustomDetailsScreens();
                      }));
                    }
                  },
                ),
              ),
              LargeScreenView(
                isLargeScreen: isLargeScreen,
              ),
            ],
          );
        },
      ),
    );
  }
}

class ItemsListView extends StatelessWidget {
  ItemsListView({this.dataList, this.onPressCallBack});

  final List<Widget> dataList;
  final Function onPressCallBack;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: dataList.length,
        itemBuilder: (context, index) {
          return CustomListTile(
            onClick: () {
              onPressCallBack(index);
            },
            titleWidget: dataList[index],
            leadingWidget: Container(
              padding: EdgeInsets.only(right: 12.0),
              child: Icon(Icons.autorenew, color: Colors.black),
            ),
            trailingWidget: Column(
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
            ),
            subTitleWidget: Row(
              children: <Widget>[
                Icon(Icons.linear_scale, color: Colors.blue),
                Text(" Intermediate", style: kTypographySubhead)
              ],
            ),
          );
        });
  }
}
