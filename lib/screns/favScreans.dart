// ignore_for_file: camel_case_types, use_key_in_widget_constructors, file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../moduls/meal.dart';
import '../providers/meal_provider.dart';
import '../widgts/meal_item.dart';
import '../providers/language_provider.dart';

class favoriteScreans extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var lan = Provider.of<LanguageProvider>(context, listen: true);
    final List<meal> favoritemeals =
        Provider.of<MealProvider>(context, listen: true).favoriteMeals;
    bool isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    var dw = MediaQuery.of(context).size.width;
    if (favoritemeals.isEmpty) {
      return  Center(
        child: Text(

          lan.getTexts('favorites_text').toString(),
          style: const TextStyle(fontSize: 27),
        ),
      );
    } else {
      return GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: dw <= 400 ? 400 : 500,
          childAspectRatio: isLandScape ? dw / (dw * 0.8) : dw / (dw * 0.75),
          crossAxisSpacing: 0,
          mainAxisSpacing: 0,
        ),
        itemBuilder: (ctx, idx) {
          return MealItem(
            id: favoritemeals[idx].id,
            imageUrl: favoritemeals[idx].imageUrl,
            duration: favoritemeals[idx].duration,
            complexity: favoritemeals[idx].complexity,
            affordability: favoritemeals[idx].affordability,
          );
        },
        itemCount: favoritemeals.length,
      );
    }
  }
}
