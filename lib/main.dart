import 'package:flutter/material.dart';
import 'package:islami/home/HomeScreen.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:islami/quran/suradetails.dart';
import 'package:provider/provider.dart';
import 'hades/hadesdetails.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (buildContext) {
        return AppConfigProvider();
      },
      child: YousefApp()));
}

class MyThemeData {
  static const colorDark = Color.fromARGB(255, 250, 204, 29);
  static const colorlight = Color.fromARGB(255, 245, 241, 241);
  static const primaryColor = Color.fromARGB(255, 183, 147, 95);
  static const primaryColorDark = Color.fromARGB(255, 20, 26, 46);
  static final ThemeData lightTheme = ThemeData(
    primaryColor: MyThemeData.primaryColor,
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 30),
        iconTheme: IconThemeData(color: Colors.black)),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.white,
    ),
  );
  static final ThemeData darkTheme = ThemeData(
    primaryColor: MyThemeData.primaryColorDark,
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 30),
        iconTheme: IconThemeData(color: Colors.black)),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: MyThemeData.colorDark,
      unselectedItemColor: Colors.white,
    ),
  );
}

class YousefApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return MaterialApp(
      title: 'Islami',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.applang),
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      themeMode: provider.appThem,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SuraDetails.routeName: (context) => SuraDetails(),
        HadesDetails.routeName: (context) => HadesDetails(),
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}
