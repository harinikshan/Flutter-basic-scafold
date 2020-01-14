import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:krowdforce/constants/app_localizations.dart';
import 'package:krowdforce/constants/constants.dart';
import 'package:krowdforce/screens/search_screen.dart';
import 'package:krowdforce/widgets/choice_chip.dart';
import 'package:krowdforce/widgets/filter_chip.dart';
import 'package:krowdforce/widgets/material_bottom_sheet.dart';
import 'package:krowdforce/widgets/radio_button_component.dart';
import 'package:krowdforce/widgets/radio_button_enum.dart';

class DetailScreenComponent extends StatefulWidget {
  DetailScreenComponent({this.viewAppBar});

  final bool viewAppBar;

  @override
  _DetailScreenComponentState createState() => _DetailScreenComponentState();
}

class _DetailScreenComponentState extends State<DetailScreenComponent> {
  var radioButtonValue = RadioButtonValues.radioButton1;

  ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.viewAppBar
          ? AppBar(
              actions: <Widget>[
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, SearchScreen.id);
                  },
                  icon: Icon(
                    Icons.search,
                  ),
                ),
                IconButton(
                  onPressed: () => materialBottomSheet(context),
                  icon: Icon(
                    Icons.more_vert,
                  ),
                ),
              ],
            )
          : null,
      body: SafeArea(
        child: Scrollbar(
            child: NotificationListener<ScrollNotification>(
          child: ListView(
            controller: _scrollController,
            children: <Widget>[
              SizedBox(
                height: kSpaceVerticalInnerComponentPadding,
              ),
              Body1(
                radioButtonValue: radioButtonValue,
                radioButton1Tap: (value) {
                  setState(() {
                    radioButtonValue = value;
                  });
                },
                radioButton2Tap: (value) {
                  setState(() {
                    radioButtonValue = value;
                  });
                },
              ),
              SizedBox(
                height: kSpaceVerticalInnerComponentPadding,
              ),
              Body2(),
              SizedBox(
                height: kSpaceVerticalInnerComponentPadding,
              ),
              Body3(),
              SizedBox(
                height: kSpaceVerticalInnerComponentPadding,
              ),
              Body4(),
            ],
          ),

          // ignore: missing_return
          onNotification: (ScrollNotification notification) {
            if (notification is ScrollEndNotification) {
              if (notification.metrics.pixels ==
                  notification.metrics.maxScrollExtent) {
                materialBottomSheet(context);
              }
            }
          },
        )),
      ),
    );
  }
}

class Body1 extends StatelessWidget {
  Body1({this.radioButtonValue, this.radioButton1Tap, this.radioButton2Tap});

  final Function radioButton1Tap, radioButton2Tap;
  final radioButtonValue;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(kSpaceMarginLeftRight),
          child: Text(
            AppLocalizations.of(context).translate(kBody_1),
            style: kTypographyTitle,
          ),
        ),
        RadioButtonComponent(
            radioButtonValue: radioButtonValue,
            radioButton1Tap: radioButton1Tap),
        RadioButtonComponent(
            radioButtonValue: radioButtonValue,
            radioButton1Tap: radioButton2Tap),
      ],
    );
  }
}

class Body2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(kSpaceMarginLeftRight),
          child: Text(
            AppLocalizations.of(context).translate(kBody_2),
            style: kTypographyTitle,
          ),
        ),
        ListTile(
          leading: CircleAvatar(child: Icon(Icons.attach_file)),
          title: Text(
            AppLocalizations.of(context).translate(kSubHeader),
            style: kTypographyBody1,
          ),
        ),
        ListTile(
          leading: CircleAvatar(child: Icon(Icons.attach_file)),
          title: Text(AppLocalizations.of(context).translate(kSubHeader),
              style: kTypographyBody1),
        ),
      ],
    );
  }
}

class Body3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(kSpaceMarginLeftRight),
          child: Text(
            AppLocalizations.of(context).translate(kBody_3),
            style: kTypographyTitle,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(kSpaceMarginLeftRight),
          child: Text(
            'Body 1. Chambray Carles Terry Gibson balls plaid wolf. Disrupt fashion axe 90\'s quinoa +1 Neutra. Irony ethnic ennui McSweeney\'s, semiotics small batch squid direct trade. Readymade salvia Echo Park scenester. Farm-to-table selvage small batch swag asymmetrical whatever, tattooed American Apparel meh viral wolf tofu trust fund you probably haven\'t',
            style: kTypographyBody1,
          ),
        ),
      ],
    );
  }
}

class Body4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(kSpaceMarginLeftRight),
          child: Text(
            AppLocalizations.of(context).translate(kBody_4),
            style: kTypographyTitle,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(kSpaceMarginLeftRight),
          child: Wrap(
            spacing: kSpaceChipLeft,
            runSpacing: kSpaceChipBottom,
            children: <Widget>[
              FilterChipWidget('Apple'),
              FilterChipWidget('Orange'),
              FilterChipWidget('Grapefruit'),
              FilterChipWidget('Blueberry'),
              FilterChipWidget('Watermelon'),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(kSpaceMarginLeftRight),
          child: Wrap(
            spacing: kSpaceChipLeft,
            runSpacing: kSpaceChipBottom,
            children: <Widget>[
              ChoiceChipWidget('Apple'),
              ChoiceChipWidget('Orange'),
              ChoiceChipWidget('Grapefruit'),
              ChoiceChipWidget('Blueberry'),
              ChoiceChipWidget('Watermelon'),
            ],
          ),
        ),
      ],
    );
  }
}
