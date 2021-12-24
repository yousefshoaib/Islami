import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/main.dart';
import 'package:islami/quran/VerseWidget.dart';

class SuraDetails extends StatefulWidget {
  static const String routeName = 'Sura_details';

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  List<String> Ayat = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as SuraDetailsArgs;
    //String num = '${args.index+1}';
    if (Ayat.isEmpty) ReadSura(args.index);
    return Stack(children: [
      Image.asset(
        'assets/images/main_background.png',
        fit: BoxFit.fill,
        width: double.infinity,
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text('${args.suraname}'), // - $num'
        ),
        body: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
          ),
          margin: EdgeInsets.symmetric(horizontal: 24, vertical: 46),
          padding: EdgeInsets.all(9),
          child: Ayat.isEmpty
              ? Center(
                  child: CircularProgressIndicator(
                  color: MyThemeData.primaryColor,
                ))
              : ListView.separated(
                  itemBuilder: (
                    buildcontext,
                    index,
                  ) {
                    return VerseWidget(Ayat[index], index);
                  },
                  itemCount: Ayat.length,
                  separatorBuilder: (buildcontext, index) {
                    return Container(
                      height: 1,
                      color: Theme.of(context).primaryColor,
                      margin: EdgeInsets.symmetric(horizontal: 24),
                    );
                  },
                ),
        ),
      )
    ]);
  }

  void ReadSura(int index) async {
    String fileName = 'assets/file/${index + 1}.txt';
    String fileContent = await rootBundle.loadString(fileName);
    // print(fileContent);
    List<String> verses = fileContent.split('\n');
    Ayat = verses;
    setState(() {});
  }
}

class SuraDetailsArgs {
  String suraname;
  int index;

  SuraDetailsArgs(this.index, this.suraname);
}
