import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import 'hadeswidget.dart';

class HadesTap extends StatefulWidget {
  @override
  State<HadesTap> createState() => _HadesTapState();
}

class _HadesTapState extends State<HadesTap> {
  List<HadesItem> allHadesItem = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    if (allHadesItem.isEmpty) readHadesfile();
    return Column(children: [
      Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo_hades.png'),
          ],
        ),
      ),
      Expanded(
          flex: 3,
          child: allHadesItem.isEmpty
              ? Center(
              child: CircularProgressIndicator(
                color: MyThemeData.primaryColor,
              ))
              : ListView.separated(
              itemBuilder: (context, index) {
                return HadesWidget(allHadesItem[index]);
              },
              itemCount: allHadesItem.length,
              separatorBuilder: (buildcontext, index) {
                return Container(
                  height: 2,
                      color: provider.appThem == ThemeMode.light
                          ? Theme.of(context).primaryColor
                          : MyThemeData.colorDark,
                      margin: EdgeInsets.symmetric(horizontal: 24),
                    );
              }))
    ]);
  }

  void readHadesfile() async {
    List<HadesItem> allAhadesData = [];
    String fileContent = await rootBundle.loadString('assets/file/ahades.txt');
    List<String> allAhades = fileContent.split('#\r\n');
    for (int i = 0; i < allAhades.length; i++) {
      List<String> singelHadesContent = allAhades[i].split('\n');
      String title = singelHadesContent[0];
      String content = '';
      for (int j = 1; j < singelHadesContent.length; j++) {
        content += singelHadesContent[j] + ' ';
      }
      HadesItem item = HadesItem(title, content);
      allAhadesData.add(item);
      allHadesItem = allAhadesData;
      setState(() {});
    }
  }
}

class HadesItem {
  String title;
  String content;

  HadesItem(this.title, this.content);
}
