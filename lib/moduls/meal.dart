// ignore_for_file: constant_identifier_names

import 'dart:core';

// ignore: camel_case_types
class meal {
  final String id;
  final List<String> categories;

  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isVegan;
  final bool isVegetarian;
  final bool isLactoseFree;

  const meal({
    required this.id,
    required this.categories,
  
    required this.imageUrl,
    
    required this.duration,
    required this.complexity,
    required this.affordability,
    required this.isGlutenFree,
    required this.isVegan,
    required this.isVegetarian,
    required this.isLactoseFree,
  });
}

enum Complexity {
  Simple,
  Challenging,
  Hard,
}

enum Affordability {
  Affordable,
  Pricey,
  Luxurious,
}
