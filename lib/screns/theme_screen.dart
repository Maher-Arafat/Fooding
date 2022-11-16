// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:meal_app/providers/theme_provider.dart';
import 'package:meal_app/widgts/main_drawer.dart';
import 'package:provider/provider.dart';

import '../providers/language_provider.dart';

class ThemeScreen extends StatelessWidget {
  static const routeName = '/theme';
  bool fromOnBoarding = false;
  ThemeScreen({Key? key, this.fromOnBoarding = false}) : super(key: key);
  Widget buildRadioListTitle(
      ThemeMode themVal, String txt, IconData? icon, BuildContext ctx) {
    return RadioListTile(
      activeColor: Provider.of<ThemeProvider>(ctx, listen: false).accentColor,
      secondary: Icon(icon, color: Theme.of(ctx).splashColor),
      value: themVal,
      groupValue: Provider.of<ThemeProvider>(ctx, listen: true).tm,
      onChanged: (newThemeval) => Provider.of<ThemeProvider>(ctx, listen: false)
          .themeModeChange(newThemeval),
      title: Text(txt),
    );
  }

  @override
  Widget build(BuildContext context) {
    var lan = Provider.of<LanguageProvider>(context, listen: true);
    return Scaffold(
      appBar: fromOnBoarding
          ? AppBar(backgroundColor: Theme.of(context).canvasColor, elevation: 0)
          : AppBar(
              title: const Text('Themes'),
            ),
      body: Column(children: [
        Container(
          padding:const EdgeInsets.all(20),
          child: Text(
            lan.getTexts('theme_screen_title').toString(),
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        Expanded(
          child: ListView(
            children: [
              Container(
                padding:const EdgeInsets.all(20),
                child: Text(
                  lan.getTexts('theme_mode_title').toString(),
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              buildRadioListTitle(
                  ThemeMode.system,
                  lan.getTexts('System_default_theme').toString(),
                  null,
                  context),
              buildRadioListTitle(
                  ThemeMode.light,
                  lan.getTexts('light_theme').toString(),
                  Icons.wb_sunny_outlined,
                  context),
              buildRadioListTitle(
                  ThemeMode.dark,
                  lan.getTexts('dark_theme').toString(),
                  Icons.nights_stay_outlined,
                  context),
              buildListTitle(context, 'primary'),
              buildListTitle(context, 'accent'),
              SizedBox(height: fromOnBoarding ? 80 : 0),
            ],
          ),
        ),
      ]),
      drawer: fromOnBoarding ? null : MainDrawer(),
    );
  }

  ListTile buildListTitle(BuildContext context, txt) { 
    var lan = Provider.of<LanguageProvider>(context, listen: true);
    var primaryColor =
        Provider.of<ThemeProvider>(context, listen: true).primaryColor;
    var accentColor =
        Provider.of<ThemeProvider>(context, listen: true).accentColor;
    return ListTile(
      title: Text(
          txt == 'primary'
              ? lan.getTexts('primary').toString()
              : lan.getTexts('accent').toString(),
          style: Theme.of(context).textTheme.headline6),
      trailing: CircleAvatar(
          backgroundColor: txt == 'primary' ? primaryColor : accentColor),
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext ctx) {
              return AlertDialog(
                elevation: 4,
                titlePadding: const EdgeInsets.all(0.0),
                contentPadding: const EdgeInsets.all(0.0),
                content: SingleChildScrollView(
                  child: ColorPicker(
                    pickerColor: txt == 'primary'
                        ? Provider.of<ThemeProvider>(ctx, listen: true)
                            .primaryColor
                        : Provider.of<ThemeProvider>(ctx, listen: true)
                            .accentColor,
                    onColorChanged: (newColor) =>
                        Provider.of<ThemeProvider>(ctx, listen: false)
                            .onChanged(newColor, txt == 'primary' ? 1 : 2),
                    colorPickerWidth: 300.0,
                    pickerAreaHeightPercent: 0.7,
                    enableAlpha: false,
                    displayThumbColor: true,
                    showLabel: false,
                  ),
                ),
              );
            });
      },
    );
  }
}
