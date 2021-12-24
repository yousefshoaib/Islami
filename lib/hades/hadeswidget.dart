import 'package:flutter/material.dart';
import 'package:islami/hades/hades.dart';
import 'package:islami/hades/hadesdetails.dart';

class HadesWidget extends StatelessWidget {
  HadesItem item;

  HadesWidget(this.item);

  @override
  Widget build(BuildContext context) {
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
            style: TextStyle(fontSize: 25),
          ),
        ),
      ),
    );
  }
}
