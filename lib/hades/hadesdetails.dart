import 'package:flutter/material.dart';
import 'package:islami/hades/hades.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

import '../main.dart';

class HadesDetails extends StatelessWidget {
  static const String routeName = 'hades_details';

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as HadesItem;
    var provider = Provider.of<AppConfigProvider>(context);
    return Stack(children: [
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
            title: Text(args.title),
          ),
          body: Container(
            child: SingleChildScrollView(
              child: Text(args.content,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: provider.appThem == ThemeMode.light
                        ? Colors.black
                        : MyThemeData.colorDark,
                    fontSize: 20,
                  )),
            ),
            decoration: BoxDecoration(
              color: provider.appThem == ThemeMode.light
                  ? Colors.white
                  : MyThemeData.primaryColorDark,
              borderRadius: BorderRadius.circular(24),
            ),
            margin: EdgeInsets.symmetric(horizontal: 24, vertical: 46),
            padding: EdgeInsets.all(16),
          ))
    ]);
  }
}
