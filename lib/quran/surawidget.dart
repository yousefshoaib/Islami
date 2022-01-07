import 'package:flutter/material.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:islami/quran/suradetails.dart';
import 'package:provider/provider.dart';

import '../main.dart';

class Sura extends StatelessWidget {
  String suraname;

  int index;

  Sura(this.index, this.suraname);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          SuraDetails.routeName,
          arguments: SuraDetailsArgs(index, suraname),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          suraname,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: provider.appThem == ThemeMode.light
                  ? Colors.black
                  : MyThemeData.colorDark,
              fontSize: 25),
        ),
      ),
    );
  }
}
