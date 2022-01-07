import 'package:flutter/material.dart';
import 'package:islami/hades/hades.dart';
import 'package:islami/hades/hadesdetails.dart';
import 'package:islami/main.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class HadesWidget extends StatelessWidget {
  HadesItem item;

  HadesWidget(this.item);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          HadesDetails.routeName,
          arguments: item,
        );
      },
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            item.title,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: provider.appThem == ThemeMode.light
                    ? Colors.black
                    : MyThemeData.colorDark,
                fontSize: 25),
          ),
        ),
      ),
    );
  }
}
