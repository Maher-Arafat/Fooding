// ignore_for_file: use_key_in_widget_constructors, avoid_types_as_parameter_names, unused_element

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../moduls/meal.dart';
import '../providers/language_provider.dart';
import '../providers/meal_provider.dart';
import '../widgts/meal_item.dart';

class CategogryMealScrean extends StatefulWidget {
  static const routeName = 'category_meals';

  @override
  State<CategogryMealScrean> createState() => _CategogryMealScreanState();
}

class _CategogryMealScreanState extends State<CategogryMealScrean> {
  String ctgryId = '';
  List<meal> dsplymeal = <meal>[];
  @override
  void didChangeDependencies() {
    final List<meal> availablemeals =
        Provider.of<MealProvider>(context, listen: true).availableMeals;
    final routArg =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    ctgryId = routArg['id']!;

    dsplymeal = availablemeals.where((meal) {
      return meal.categories.contains(ctgryId);
    }).toList();
    super.didChangeDependencies();
  }

  void _removMeal(String mealId) {
    setState(() {
      dsplymeal.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    var lan = Provider.of<LanguageProvider>(context, listen: true);
    bool isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    var dw = MediaQuery.of(context).size.width;
    return Directionality(
      textDirection: lan.isEn ? TextDirection.ltr : TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(title: Text(lan.getTexts('cat-$ctgryId').toString())),
        body: GridView.builder(
          itemBuilder: (ctx, idx) {
            return MealItem(
              id: dsplymeal[idx].id,
              imageUrl: dsplymeal[idx].imageUrl,
              duration: dsplymeal[idx].duration,
              complexity: dsplymeal[idx].complexity,
              affordability: dsplymeal[idx].affordability,
            );
          },
          itemCount: dsplymeal.length,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: dw <= 400 ? 400 : 500,
            childAspectRatio: isLandScape ? dw / (dw * 0.8) : dw / (dw * 0.75),
            crossAxisSpacing: 0,
            mainAxisSpacing: 0,
          ),
        ),
      ),
    );
  }
}
