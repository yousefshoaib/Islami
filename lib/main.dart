import 'package:flutter/material.dart';
import 'package:islami/home/HomeScreen.dart';
import 'package:islami/quran/suradetails.dart';

import 'hades/hadesdetails.dart';

void main() {
  runApp(YousefApp());
}

class MyThemeData {
  static const primaryColor = Color.fromARGB(255, 183, 147, 95);
}

class YousefApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Islami',
      theme: ThemeData(
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
      ),
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SuraDetails.routeName: (context) => SuraDetails(),
        HadesDetails.routeName: (context) => HadesDetails(),
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}
