import 'package:flutter/material.dart';
import 'package:islami/hades/hades.dart';

class HadesDetails extends StatelessWidget {
  static const String routeName = 'hades_details';

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as HadesItem;
    return Stack(children: [
      Image.asset(
        'assets/images/main_background.png',
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
                    fontSize: 20,
                  )),
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
            ),
            margin: EdgeInsets.symmetric(horizontal: 24, vertical: 46),
            padding: EdgeInsets.all(16),
          ))
    ]);
  }
}
