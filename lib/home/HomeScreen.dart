import 'package:flutter/material.dart';
import 'package:islami/hades/hades.dart';
import 'package:islami/main.dart';
import 'package:islami/quran/quran.dart';
import 'package:islami/rideo/rideo.dart';
import 'package:islami/sebha/sebha.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentindex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/main_background.png',
          fit: BoxFit.fill,
          width: double.infinity,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text('islame'),
          ),
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: MyThemeData.primaryColor,
            ),
            child: BottomNavigationBar(
                currentIndex: currentindex,
                onTap: (index) {
                  currentindex = index;
                  setState(() {});
                },
                items: [
                  BottomNavigationBarItem(
                      icon: ImageIcon(AssetImage('assets/images/ic_quran.png')),
                      label: ('quran')),
                  BottomNavigationBarItem(
                      icon: ImageIcon(AssetImage('assets/images/ic_hades.png')),
                      label: ('hades')),
                  BottomNavigationBarItem(
                      icon: ImageIcon(AssetImage('assets/images/ic_sebha.png')),
                      label: ('sebha')),
                  BottomNavigationBarItem(
                      icon: ImageIcon(AssetImage('assets/images/ic_radio.png')),
                      label: ('radio')),
                ]),
          ),
          body: Container(
            child: views[currentindex],
          ),
        ),
      ],
    );
  }

  List<Widget> views = [QuranTap(), HadesTap(), SebhaTap(), RideoTap()];
}
