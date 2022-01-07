import 'package:flutter/material.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class LanguageButtonShet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      child: Column(
        children: [
          InkWell(
              onTap: () {
                provider.chengeLang('en');
              },
              child: provider.applang == 'en'
                  ? selwctedItemWidget('Einglish', context)
                  : unselwctedItemWidget('Einglish', context)),
          InkWell(
              onTap: () {
                provider.chengeLang('ar');
              },
              child: provider.applang == 'ar'
                  ? selwctedItemWidget('العربية', context)
                  : unselwctedItemWidget('العربية', context)),
        ],
      ),
    );
  }

  Widget selwctedItemWidget(String text, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 20,
            ),
          ),
          Icon(
            Icons.check,
            color: Theme.of(context).primaryColor,
          ),
        ],
      ),
    );
  }

  Widget unselwctedItemWidget(String text, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
