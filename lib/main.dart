import 'package:flutter/material.dart';
import 'package:krowdforce/bloc/theme.dart';
import 'package:krowdforce/screens/bulk_action_screen.dart';
import 'package:krowdforce/screens/search_screen.dart';
import 'package:provider/provider.dart';
import 'screens/font_style_screen.dart';
import 'package:krowdforce/screens/font_style_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'constants/app_localizations.dart';
import 'screens/list_detail_view_navigation_screen.dart';
import 'screens/list_detail_view_screen.dart';
import 'screens/bulk_selection_list_screen.dart';
import 'screens/place_holder_screen.dart';
import 'package:krowdforce/screens/details_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeChanger>(
      create: (_) => ThemeChanger(false),
      child: Material(),
    );
  }
}

class Material extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return MaterialApp(
      title: 'Flutter Demo',
//        darkTheme: ThemeData.dark().copyWith(),
//        theme: ThemeData().copyWith(
//          tabBarTheme: TabBarTheme(
//            labelColor: Colors.blue,
//            unselectedLabelColor: Colors.blue[100],
//          ),
//        ),
      theme: theme.getThemeData(),
      initialRoute: BulkActionScreen.id,
      routes: {
        StyleScreen.id: (context) => StyleScreen(),
        ListDetailViewNavigationScreen.id: (context) =>
            ListDetailViewNavigationScreen(),
        ListDetailViewScreen.id: (context) => ListDetailViewScreen(null),
        BulkSelectionListScreen.id: (context) => BulkSelectionListScreen(),
        PlaceHolderScreen.id: (context) => PlaceHolderScreen(),
        CustomDetailsScreens.id: (context) => CustomDetailsScreens(),
        BulkActionScreen.id: (context) => BulkActionScreen(),
        SearchScreen.id: (context) => SearchScreen(),
      },

      //localization

      // List all of the app's supported locales here
      supportedLocales: [
        Locale('en', 'US'),
        Locale('en', 'IN'),
      ],

      // These delegates make sure that the localization data for the proper language is loaded
      localizationsDelegates: [
        // THIS CLASS WILL BE ADDED LATER
        // A class which loads the translations from JSON files
        AppLocalizations.delegate,
        // Built-in localization of basic text for Material widgets
        GlobalMaterialLocalizations.delegate,
        // Built-in localization for text direction LTR/RTL
        GlobalWidgetsLocalizations.delegate,
      ],
      // Returns a locale which will be used by the app
      localeResolutionCallback: (locale, supportedLocales) {
        // Check if the current device locale is supported
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale.languageCode &&
              supportedLocale.countryCode == locale.countryCode) {
            return supportedLocale;
          }
        }
        // If the locale of the device is not supported, use the first one
        // from the list (English, in this case).
        return supportedLocales.first;
      },

      //localization
    );
  }
}
