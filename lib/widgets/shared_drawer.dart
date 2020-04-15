import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SharedDrawer extends StatelessWidget {
  void changeLanguage(context, locale) {
    EasyLocalization.of(context).locale = locale;
    Navigator.pop(context);
    Navigator.pop(context);
  }

  void openLanguageSelector(BuildContext parentContext) {
    showDialog(
      context: parentContext,
      builder: (context) {
        return SimpleDialog(title: Text("Change Language"), children: <Widget>[
          SimpleDialogOption(
            child: ListTile(
              title: Text('English'),
              trailing: Checkbox(
                value: Localizations.localeOf(context).languageCode == "en",
                onChanged: (bool) {
                  changeLanguage(parentContext, Locale("en", "US"));
                },
              ),
            ),
          ),
          SimpleDialogOption(
            child: ListTile(
              title: Text('አማርኛ'),
              trailing: Checkbox(
                value: Localizations.localeOf(context).languageCode == "am",
                onChanged: (bool) {
                  changeLanguage(parentContext, Locale("am", "ET"));
                },
              ),
            ),
          ),
        ]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('settings').tr(),
            decoration: BoxDecoration(
              color: Colors.blue,
//                image: DecorationImage(
//                  image: AssetImage('assets/images/back.jpeg'),
//                  fit: BoxFit.cover
//                ),
            ),
          ),
          ListTile(
            title: Text('language').tr(),
            trailing: Icon(Icons.language),
            onTap: () => openLanguageSelector(context),
          ),
        ],
      ),
    );
  }
}
