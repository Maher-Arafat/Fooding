// ignore_for_file: camel_case_types, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:meal_app/providers/meal_provider.dart';
import 'package:provider/provider.dart';
import '../providers/language_provider.dart';
import '../providers/theme_provider.dart';
import '../widgts/main_drawer.dart';
import 'favScreans.dart';
import 'catogries_screans.dart';

class tapsScreans extends StatefulWidget {
  static const routeName = 'tab_screen';
  @override
  State<tapsScreans> createState() => _tapsScreansState();
}

class _tapsScreansState extends State<tapsScreans> {
  late List<Map<String, Object>> _pages = [];
  int _slctpageIdx = 0;

  @override
  void initState() {
    Provider.of<MealProvider>(context, listen: false).getData();
  Provider.of<ThemeProvider>(context, listen: false).getThemeMode();
    Provider.of<ThemeProvider>(context, listen: false).getThemeColors();
    Provider.of<LanguageProvider>(context, listen: false).getLan();
    super.initState();
  }

  void _slctPage(int val) {
    setState(() {
      _slctpageIdx = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    var lan = Provider.of<LanguageProvider>(context, listen: true);
    _pages = [
      {
        'page': const ctgrisScrean(),
        'title': lan.getTexts('categories').toString(),
      },
      {
        'page': favoriteScreans(),
        'title': lan.getTexts('your_favorites').toString(),
      }
    ];
    return Directionality(
      textDirection: lan.isEn ? TextDirection.ltr : TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text(_pages[_slctpageIdx]['title'].toString()),
        ),
        body: _pages[_slctpageIdx]['page'] as Widget,
        // ignore: prefer_const_literals_to_create_immutables
        bottomNavigationBar: BottomNavigationBar(
            onTap: _slctPage,
            items: [
              BottomNavigationBarItem(
                icon:const Icon(Icons.category),
                label: lan.getTexts('categories').toString(),
              ),
              BottomNavigationBarItem(
                icon:const Icon(Icons.star),
                label: lan.getTexts('your_favorites').toString(),
              )
            ],
            currentIndex: _slctpageIdx,
            selectedItemColor: Theme.of(context).colorScheme.secondary,
            unselectedItemColor: Colors.white,
            backgroundColor: Theme.of(context).colorScheme.primary),
        drawer: MainDrawer(),
      ),
    );
  }
}
