import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/hades/hades.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:islami/quran/quran.dart';
import 'package:islami/rideo/rideo.dart';
import 'package:islami/sebha/sebha.dart';
import 'package:islami/settings/settings_tap.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentindex = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Stack(
      children: [
        Image.asset(
          provider.appThem == ThemeMode.light
              ? 'assets/images/main_background.png'
              : 'assets/images/main_background_dark.png',
          fit: BoxFit.fill,
          width: double.infinity,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.app_title),
          ),
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Theme.of(context).primaryColor,
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
                      label: (AppLocalizations.of(context)!.quran)),
                  BottomNavigationBarItem(
                      icon: ImageIcon(AssetImage('assets/images/ic_hades.png')),
                      label: (AppLocalizations.of(context)!.hades)),
                  BottomNavigationBarItem(
                      icon: ImageIcon(AssetImage('assets/images/ic_sebha.png')),
                      label: (AppLocalizations.of(context)!.sebha)),
                  BottomNavigationBarItem(
                      icon: ImageIcon(AssetImage('assets/images/ic_radio.png')),
                      label: (AppLocalizations.of(context)!.radio)),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.settings),
                      label: (AppLocalizations.of(context)!.settings)),
                ]),
          ),
          body: Container(
            child: views[currentindex],
          ),
        ),
      ],
    );
  }

  List<Widget> views = [
    QuranTap(),
    HadesTap(),
    SebhaTap(),
    RideoTap(),
    SettingTap()
  ];
}
