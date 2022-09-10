// ignore_for_file: avoid_types_as_parameter_names, override_on_non_overriding_member, prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:meal_app/providers/meal_provider.dart';
import 'package:meal_app/providers/theme_provider.dart';
import 'package:meal_app/screns/on_boarding_screen.dart';
import 'package:meal_app/screns/theme_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './screns/filters_screans.dart';
import './screns/taps_screan.dart';
import '../screns/meal_detail_screan.dart';
import '../screns/category_meal_screan.dart';
import './screns/catogries_screans.dart';
import 'providers/language_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  Widget homescreen =
      prefs.getBool('watched') ?? false ? tapsScreans() : const OnBoardingScreen();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<MealProvider>(
          create: (ctx) => MealProvider(),
        ),
        ChangeNotifierProvider<ThemeProvider>(
          create: (ctx) => ThemeProvider(),
        ),
        ChangeNotifierProvider<LanguageProvider>(
          create: (ctx) => LanguageProvider(),
        ),
      ],
      child: MyApp(homescreen),
    ),
  );
}

class MyApp extends StatelessWidget {
  final Widget homescreen;
  MyApp(this.homescreen);
  @override
  Widget build(BuildContext context) {
    var primaryColor =
        Provider.of<ThemeProvider>(context, listen: true).primaryColor;
    var accentColor =
        Provider.of<ThemeProvider>(context, listen: true).accentColor;
    var tm = Provider.of<ThemeProvider>(context, listen: true).tm;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: tm,
      theme: ThemeData(
          canvasColor: const Color.fromRGBO(255, 254, 229, 1),
          splashColor: Colors.black87,
          cardColor: Colors.white,
          shadowColor: Colors.black54,
          unselectedWidgetColor: Colors.black54 ,
          textTheme: ThemeData.light().textTheme.copyWith(
                bodyText1: const TextStyle(
                  color: Color.fromRGBO(20, 50, 50, 1),
                ),
                headline6: const TextStyle(
                  color: Colors.black87,
                  fontFamily: 'RobotoCondensed',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
          colorScheme: ColorScheme.fromSwatch(primarySwatch: primaryColor)
              .copyWith(secondary: accentColor)),
      darkTheme: ThemeData(
          canvasColor: const Color.fromRGBO(14, 22, 33, 1),
          splashColor: Colors.white60,
          cardColor: const Color.fromRGBO(35, 34, 39, 1),
          shadowColor: Colors.white60,
          unselectedWidgetColor: Colors.white70,
          textTheme: ThemeData.dark().textTheme.copyWith(
                bodyText1: const TextStyle(
                  color: Colors.white60,
                ),
                headline6: const TextStyle(
                  color: Colors.white70,
                  fontFamily: 'RobotoCondensed',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
          colorScheme: ColorScheme.fromSwatch(primarySwatch: primaryColor)
              .copyWith(secondary: accentColor)),
      routes: {
        '/': (context) => homescreen,
        tapsScreans.routeName: (context) => tapsScreans(),
        CategogryMealScrean.routeName: (context) => CategogryMealScrean(),
        MealdetailScrean.routeName: (context) => MealdetailScrean(),
        FiltersScrean.routeName: (context) => FiltersScrean(),
        ThemeScreen.routeName: (context) => ThemeScreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meal App"),
      ),
      body: const ctgrisScrean(),
    );
  }
}
