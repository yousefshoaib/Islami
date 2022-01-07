import 'package:flutter/material.dart';
import 'package:islami/main.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class SebhaTap extends StatefulWidget {
  @override
  State<SebhaTap> createState() => _SebhaTapState();
}

class _SebhaTapState extends State<SebhaTap> {
  int count = 0;
  List<String> text = ['سبحان اللّه', 'الحمدللّه', 'اللّه أكبر'];
  int index = 0;
  double angle = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          InkWell(
            onTap: tsbeh,
            child: Stack(
              alignment: AlignmentDirectional.topCenter,
              children: [
                Container(
                    margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.height * .06),
                    child: Image.asset(provider.appThem == ThemeMode.light
                        ? 'assets/images/head_seb7a_image.png'
                        : 'assets/images/head_seb7a_image_dark.png')),
                Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * .1),
                    child: Transform.rotate(
                        angle: angle,
                        child: Image.asset(provider.appThem == ThemeMode.light
                            ? 'assets/images/body_seb7a_image.png'
                            : 'assets/images/body_seb7a_image_dark.png')))
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * .03),
              child: Text('عددالتسبيحات',
                  style: TextStyle(
                      color: provider.appThem == ThemeMode.light
                          ? Colors.black
                          : MyThemeData.colorDark,
                      fontSize: 25,
                      fontWeight: FontWeight.w500))),
          Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * .03),
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(24)),
              padding: EdgeInsets.all(15),
              child: Text('$count',
                  style: TextStyle(
                      color: provider.appThem == ThemeMode.light
                          ? Colors.black
                          : MyThemeData.colorDark,
                      fontSize: 25,
                      fontWeight: FontWeight.w500))),
          Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * .05),
              decoration: BoxDecoration(
                  color: provider.appThem == ThemeMode.light
                      ? MyThemeData.primaryColor
                      : MyThemeData.colorDark,
                  borderRadius: BorderRadius.circular(24)),
              padding: EdgeInsets.all(8),
              child: Text('${text[index]}',
                  style: TextStyle(
                      color: provider.appThem == ThemeMode.light
                          ? MyThemeData.colorlight
                          : Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold))),
        ],
      ),
    );
  }

  void tsbeh() {
    count++;
    if (count % 33 == 0) {
      if (index == text.length - 1) {
        index = 0;
      } else {
        index++;
      }
    }
    setState(() {
      angle += 15;
    });
  }
}
