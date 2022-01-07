import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class ThemeButtonShet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      child: Column(
        children: [
          InkWell(
              onTap: () {
                provider.chengeTheme(ThemeMode.light);
              },
              child: provider.appThem == ThemeMode.light
                  ? selwctedItemWidget(
                      AppLocalizations.of(context)!.light, context)
                  : unselwctedItemWidget(
                      AppLocalizations.of(context)!.light, context)),
          InkWell(
              onTap: () {
                provider.chengeTheme(ThemeMode.dark);
              },
              child: provider.appThem == ThemeMode.dark
                  ? selwctedItemWidget(
                      AppLocalizations.of(context)!.dark, context)
                  : unselwctedItemWidget(
                      AppLocalizations.of(context)!.dark, context)),
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
