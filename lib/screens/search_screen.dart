import 'package:flutter/material.dart';
import 'package:krowdforce/bloc/theme.dart';
import 'package:krowdforce/constants/constants.dart';
import 'package:krowdforce/widgets/custom_search_component.dart';
import 'package:krowdforce/widgets/previous_search_list_tiles.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  static final id = 'search_screen';

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _searchController = TextEditingController();
  TextEditingController _locationController = TextEditingController();

  @override
  void initState() {
    _locationController.text = 'Home';
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            color: theme.isDarkTheme() ? Colors.black45 : Colors.blue,
            padding: EdgeInsets.symmetric(horizontal: kSpaceMarginLeftRight),
            child: SafeArea(
              child: Column(
                children: <Widget>[
                  CustomSearchComponent(
                    controller: _searchController,
                    leadingCallBack: () {},
                    searchButtonCallBack: () async {
                      String keyword = await showSearch(
                          context: context,
                          delegate:
                              KeyWordSearchResult(_searchController.text));
                      _searchController.text = keyword;
                    },
                    trailingCallBack: () {},
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomSearchComponent(
                    controller: _locationController,
                    isLocationLeadingImage: true,
                    leadingCallBack: () {
                      print('pressed');
                      _locationController.text = 'dcndjc';
                    },
                    searchButtonCallBack: () async {
                      String keyword = await showSearch(
                          context: context,
                          delegate:
                              LocationSearchResult(_locationController.text));
                      _locationController.text = keyword;
                    },
                    trailingCallBack: () {
                      print('pressed');
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => Column(
                children: <Widget>[
                  PreviousSearchListTiles(
                      searchController: _searchController,
                      locationController: _locationController),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: kSpaceMarginLeftRight),
                    child: Divider(
                      height: 20,
                    ),
                  )
                ],
              ),
              itemCount: 2,
            ),
          ),
        ],
      ),
    );
  }

//  Widget customPreviousResultScreen(String keyword, String location) {
//    return ListView.builder(
//      itemBuilder: (context, index) => Column(
//        children: <Widget>[
//          ListTile(
//            leading: Icon(Icons.history),
//            trailing: Row(
//              children: <Widget>[
//                Icon(Icons.history),
//                Icon(Icons.history),
//              ],
//            ),
//            title: Text(keyword),
//            subtitle: Text(location),
//          ),
//          Container(
//            child: Divider(
//              height: 20,
//            ),
//          ),
//        ],
//      ),
//      itemCount: 4,
//    );
//  }
}

class KeyWordSearchResult extends SearchDelegate<String> {
  KeyWordSearchResult(this.keyword);

  final String keyword;

  final List _keyWord = [
    'iOS developer',
    'Android developer',
    'Flutter developer',
    'React Native developer',
    'Manager',
    'UI designer'
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return null;
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    close(context, query);
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    // TODO: implement buildSuggestions
    List suggestion = query.length < 3
        ? List()
        : _keyWord
            .where(
                (value) => value.toLowerCase().startsWith(query.toLowerCase()))
            .toList();
    // TODO: implement buildResults
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          query = suggestion[index];
          showResults(context);
        },
        leading: Icon(Icons.business_center),
        title: Text(suggestion[index]),
      ),
      itemCount: suggestion.length,
    );
  }
}

class LocationSearchResult extends SearchDelegate<String> {
  LocationSearchResult(this.keyword);

  final String keyword;

  final List _city = [
    'Home',
    'Near me',
    'Office',
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return null;
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    close(context, query);
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    List suggestion = query.length < kWordSuggestionLimit
        ? List()
        : _city
            .where(
                (value) => value.toLowerCase().startsWith(query.toLowerCase()))
            .toList();
    // TODO: implement buildResults
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          query = suggestion[index];
          showResults(context);
        },
        leading: Icon(Icons.location_on),
        title: Text(suggestion[index]),
      ),
      itemCount: suggestion.length,
    );
  }
}
