import 'package:flutter/material.dart';
import 'package:meal_app/moduls/categroy.dart';
import 'package:meal_app/moduls/meal.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../dummy_data.dart';

class MealProvider with ChangeNotifier {
  Map<String, bool> filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<meal> availableMeals = DUMMY_MEALS;
  List<meal> favoriteMeals = [];

  List<String> prefsMealId = [];

  List<ctgry> availableCategory = [];

  void setFilters() async {
    availableMeals = DUMMY_MEALS.where((meal meal) {
      if (filters['gluten']! && !meal.isGlutenFree) {
        return false;
      }
      if (filters['lactose']! && !meal.isLactoseFree) {
        return false;
      }
      if (filters['vegan']! && !meal.isVegan) {
        return false;
      }
      if (filters['vegetarian']! && !meal.isVegetarian) {
        return false;
      }
      return true;
    }).toList();
    
    List<ctgry> ac = [];
    for (var meal in availableMeals) {
      for (var catId in meal.categories) {
        for (var cat in DUMMY_CATEGORIES) {
          if (cat.id == catId) {
            if (!ac.any((cat) => cat.id == catId)) ac.add(cat);
          }
        }
      }
    }
    availableCategory = ac;

    notifyListeners();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("gluten", filters['gluten']!);
    prefs.setBool("lactose", filters['lactose']!);
    prefs.setBool("vegan", filters['vegan']!);
    prefs.setBool("vegetarian", filters['vegetarian']!);
  }

  void getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    filters['gluten'] = prefs.getBool("gluten") ?? false;
    filters['lactose'] = prefs.getBool("lactose") ?? false;
    filters['vegan'] = prefs.getBool("vegan") ?? false;
    filters['vegetarian'] = prefs.getBool("vegetarian") ?? false;
    setFilters();

    prefsMealId = prefs.getStringList("prefsMealId") ?? [];
    for (var mealId in prefsMealId) {
      final existingIndex =
          favoriteMeals.indexWhere((meal meal) => meal.id == mealId);
      if (existingIndex < 0) {
        favoriteMeals.add(DUMMY_MEALS.firstWhere((meal meal) => meal.id == mealId));
      }
    }

    List<meal> fm = [];
    for (var favMeals in favoriteMeals) {
      for (var avMeals in availableMeals) {
        if (favMeals.id == avMeals.id) fm.add(favMeals);
      }
    }
    favoriteMeals = fm;
    notifyListeners();
  }

  void toggleFavorite(String mealId) async {
    final existingIndex = favoriteMeals.indexWhere((meal meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      favoriteMeals.removeAt(existingIndex);
      prefsMealId.remove(mealId);
    } else {
      favoriteMeals.add(DUMMY_MEALS.firstWhere((meal meal) => meal.id == mealId));
      prefsMealId.add(mealId);
    }

    notifyListeners();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList("prefsMealId", prefsMealId);
  }

  bool isFavorite(String mealId) {
    return favoriteMeals.any((meal meal) => meal.id == mealId);
  }
}
