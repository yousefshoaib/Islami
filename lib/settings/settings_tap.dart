import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:islami/settings/language_buttonshet.dart';
import 'package:islami/settings/theme_buttonshet.dart';
import 'package:provider/provider.dart';

class SettingTap extends StatefulWidget {
  @override
  State<SettingTap> createState() => _SettingTapState();
}

class _SettingTapState extends State<SettingTap> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(AppLocalizations.of(context)!.languages),
          InkWell(
            onTap: () {
              showLanguageBottomSheet();
            },
            child: Container(
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(24)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(provider.applang == 'en' ? "Einglish" : "العربية"),
                  Icon(Icons.arrow_drop_down_outlined)
                ],
              ),
            ),
          ),
          Text(AppLocalizations.of(context)!.theme),
          InkWell(
            onTap: () {
              showThemeBottomSheet();
            },
            child: Container(
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(24)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(provider.appThem == ThemeMode.light
                      ? AppLocalizations.of(context)!.light
                      : AppLocalizations.of(context)!.dark),
                  Icon(Icons.arrow_drop_down_outlined)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showLanguageBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (buildContext) {
          return LanguageButtonShet();
        });
  }

  void showThemeBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (buildContext) {
          return ThemeButtonShet();
        });
  }
}
