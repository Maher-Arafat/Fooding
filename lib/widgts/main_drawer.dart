// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:meal_app/providers/language_provider.dart';
import 'package:meal_app/screns/taps_screan.dart';
import 'package:provider/provider.dart';
import '../screns/filters_screans.dart';
import '../screns/theme_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTitle(
      String titl, IconData icon, Function() taping, BuildContext ctx) {
    return ListTile(
      leading: Icon(icon, size: 27, color: Theme.of(ctx).splashColor),
      title: Text(
        titl,
        // ignore: prefer_const_constructors
        style: TextStyle(
            color: Theme.of(ctx).textTheme.bodyText1!.color,
            fontSize: 25,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold),
      ),
      onTap: taping,
    );
  }

  @override
  Widget build(BuildContext context) {
    var lan = Provider.of<LanguageProvider>(context, listen: true);
    return SafeArea (
      child: Directionality(
        textDirection: lan.isEn ? TextDirection.ltr : TextDirection.rtl,
        child: Drawer(
          elevation: 0,
          child: Column(
            children: [
              Container(
                height: 120,
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                alignment:
                    lan.isEn ? Alignment.centerLeft : Alignment.centerRight,
                color: Theme.of(context).colorScheme.secondary,
                child: Text(
                  lan.getTexts('drawer_name').toString(),
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              buildListTitle(
                  lan.getTexts('drawer_item1').toString(), Icons.restaurant,
                  () {
                Navigator.of(context)
                    .pushReplacementNamed(tapsScreans.routeName);
              }, context),
              buildListTitle(
                  lan.getTexts('drawer_item2').toString(), Icons.settings, () {
                Navigator.of(context)
                    .pushReplacementNamed(FiltersScrean.routeName);
              }, context),
              buildListTitle(
                  lan.getTexts('drawer_item3').toString(), Icons.color_lens,
                  () {
                Navigator.of(context)
                    .pushReplacementNamed(ThemeScreen.routeName);
              }, context),
              const Divider(height: 10, color: Colors.black54),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(top: 20, right: 20),
                child: Text(lan.getTexts('drawer_switch_title').toString()),
              ),
              Padding(
                padding: EdgeInsets.only(
                    right: (lan.isEn ? 0 : 20), left: (lan.isEn ? 20 : 0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(lan.getTexts('drawer_switch_item2').toString(),
                        style: Theme.of(context).textTheme.headline6),
                    Switch(
                      value:
                          Provider.of<LanguageProvider>(context, listen: true)
                              .isEn,
                      onChanged: (nVal) {
                        Provider.of<LanguageProvider>(context, listen: false)
                            .changeLan(nVal);
                        Navigator.of(context).pop();
                      },
                      //inactiveTrackColor: Provider.of<ThemeProvider>(context, listen: true).tm==,
                    ),
                    Text(lan.getTexts('drawer_switch_item1').toString(),
                        style: Theme.of(context).textTheme.headline6),
                  ],
                ),
              ),
              const Divider(height: 10, color: Colors.black54),
            ],
          ),
        ),
      ),
    );
  }
}
