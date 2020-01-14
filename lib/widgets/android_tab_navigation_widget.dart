import 'package:flutter/material.dart';

class AndroidTabNavigation extends StatelessWidget {
  AndroidTabNavigation({this.titleList, this.screenList, this.tabController});

  final TabController tabController;
  final List<Widget> titleList;
  final List<Widget> screenList;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Material(
          child: TabBar(
            labelPadding: EdgeInsets.symmetric(vertical: 12),
            controller: tabController,
            tabs: titleList,
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: tabController,
            children: screenList,
          ),
        ),
      ],
    );
  }
}
