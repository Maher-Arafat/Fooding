// ignore_for_file: use_key_in_widget_constructors, non_constant_identifier_names, unused_local_variable, must_call_super, dead_code, must_be_immutable

import 'package:flutter/material.dart';
import 'package:meal_app/providers/language_provider.dart';
import 'package:meal_app/providers/theme_provider.dart';
import 'package:provider/provider.dart';
import '../providers/meal_provider.dart';
import '../widgts/main_drawer.dart';

class FiltersScrean extends StatefulWidget {
  static const routeName = '/filters';
  bool fromOnBoarding = false;
  FiltersScrean({this.fromOnBoarding = false});
  @override
  State<FiltersScrean> createState() => _FiltersScreanState();
}

class _FiltersScreanState extends State<FiltersScrean> {
  Widget buildSwtcLstTitl(
      String titl, String dscrption, bool crntval, Function(bool) updat) {
    return SwitchListTile(
      title: Text(titl),
      subtitle: Text(dscrption),
      value: crntval,
      onChanged: updat, //(v) => updat(v),
      activeColor: Provider.of<ThemeProvider>(context, listen: true).accentColor,
      inactiveTrackColor:
          Provider.of<ThemeProvider>(context, listen: true).tm ==
                  ThemeMode.light
              ? null
              : Colors.black,
    );
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, bool> crntFltrs =
        Provider.of<MealProvider>(context, listen: true).filters;
    bool fromOnBoarding = false;
    var lan = Provider.of<LanguageProvider>(context, listen: true);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: false,
            title: fromOnBoarding
                ? null
                : Text(lan.getTexts('filters_appBar_title').toString()),
            backgroundColor: fromOnBoarding
                ? Theme.of(context).canvasColor
                : Theme.of(context).colorScheme.primary,
            elevation: fromOnBoarding ? 0 : 5,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    lan.getTexts('filters_screen_title').toString(),
                    style: Theme.of(context).textTheme.headline6,
                    textAlign: TextAlign.center,
                  ),
                ),
                buildSwtcLstTitl(
                  lan.getTexts('Gluten-free').toString(),
                  lan.getTexts('Gluten-free-sub').toString(),
                  crntFltrs['gluten']??false,
                  (nval) {
                    setState(() {
                      crntFltrs['gluten'] = nval;
                    });
                    Provider.of<MealProvider>(context, listen: false)
                        .setFilters();
                  },
                ),
                buildSwtcLstTitl(
                  lan.getTexts('Lactose-free').toString(),
                  lan.getTexts('Lactose-free_sub').toString(),
                  crntFltrs['lactose']??false,
                  (nval) {
                    setState(() {
                      crntFltrs['lactose'] = nval;
                    });
                    Provider.of<MealProvider>(context, listen: false)
                        .setFilters();
                  },
                ),
                buildSwtcLstTitl(
                    lan.getTexts('Vegetarian').toString(),
                    lan.getTexts('Vegetarian-sub').toString(),
                    crntFltrs['vegetarian']??false, (nval) {
                  setState(() {
                    crntFltrs['vegetarian'] = nval;
                  });
                  Provider.of<MealProvider>(context, listen: false)
                      .setFilters();
                }),
                buildSwtcLstTitl(
                  lan.getTexts('Vegan').toString(),
                  lan.getTexts('Vegan-sub').toString(),
                  crntFltrs['vegan']??false,
                  (nval) {
                    setState(() {
                      crntFltrs['vegan'] = nval;
                    });
                    Provider.of<MealProvider>(context, listen: false)
                        .setFilters();
                  },
                ),
                SizedBox(height: fromOnBoarding ? 80 : 0),
              ],
            ),
          ),
        ],
      ),
      drawer: fromOnBoarding ? null : MainDrawer(),
    );
  }
}
