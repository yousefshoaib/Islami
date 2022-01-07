import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/main.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:islami/quran/VerseWidget.dart';
import 'package:provider/provider.dart';

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
    var provider = Provider.of<AppConfigProvider>(context);
    //String num = '${args.index+1}';
    if (Ayat.isEmpty) ReadSura(args.index);
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
          title: Text('${args.suraname}'), // - $num'
        ),
        body: Container(
          decoration: BoxDecoration(
            color: provider.appThem == ThemeMode.light
                ? Colors.white
                : MyThemeData.primaryColorDark,
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
                      color: provider.appThem == ThemeMode.light
                          ? Theme.of(context).primaryColor
                          : MyThemeData.colorDark,
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
