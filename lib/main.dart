import 'package:flutter/material.dart';
import 'package:islami/home/HomeScreen.dart';

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
              elevation: 0,
              titleTextStyle: TextStyle(color: Colors.black, fontSize: 30)),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.white,
          )),
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}
