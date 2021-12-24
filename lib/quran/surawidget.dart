import 'package:flutter/material.dart';
import 'package:islami/quran/suradetails.dart';

class Sura extends StatelessWidget {
  String suraname;

  int index;

  Sura(this.index, this.suraname);

  @override
  Widget build(BuildContext context) {
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
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}
