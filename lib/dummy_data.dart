import 'package:flutter/material.dart';
import 'package:meal_app/moduls/categroy.dart';
import 'package:meal_app/moduls/meal.dart';

// ignore: unnecessary_const, constant_identifier_names
const DUMMY_CATEGORIES = const [
  ctgry(
    id: 'c1',
    clr: Colors.purple,
  ),
  ctgry(
    id: 'c2',
    clr: Colors.red,
  ),
  ctgry(
    id: 'c3',
    
    clr: Colors.orange,
  ),
  ctgry(
    id: 'c4',
  
    clr: Colors.amber,
  ),
  ctgry(
    id: 'c5',

    clr: Colors.blue,
  ),
  ctgry(
    id: 'c6',
    clr: Colors.green,
  ),
  ctgry(
    id: 'c7',
  
    clr: Colors.lightBlue,
  ),
  ctgry(
    id: 'c8',

    clr: Colors.lightGreen,
  ),
  ctgry(
    id: 'c9',

    clr: Colors.pink,
  ),
  ctgry(
    id: 'c10',

    clr: Colors.teal,
  ),
];

// ignore: unnecessary_const, constant_identifier_names
const DUMMY_MEALS = const [
  meal(
    id: 'm1',
    categories: [
      'c1',
      'c2',
    ],
   
    affordability: Affordability.Affordable,
    complexity: Complexity.Simple,
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg',
    duration: 20,
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: false,
  ),
  meal(
    id: 'm2',
    categories: [
      'c2',
    ],
   
    affordability: Affordability.Affordable,
    complexity: Complexity.Simple,
    imageUrl:
        'https://cdn.pixabay.com/photo/2018/07/11/21/51/toast-3532016_1280.jpg',
    duration: 10,
   
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: false,
  ),
  meal(
    id: 'm3',
    categories: [
      'c2',
      'c3',
    ],
   
    affordability: Affordability.Pricey,
    complexity: Complexity.Simple,
    imageUrl:
        'https://cdn.pixabay.com/photo/2014/10/23/18/05/burger-500054_1280.jpg',
    duration: 45,
    
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: true,
  ),
  meal(
    id: 'm4',
    categories: [
      'c4',
    ],
    
    affordability: Affordability.Luxurious,
    complexity: Complexity.Challenging,
    imageUrl:
        'https://cdn.pixabay.com/photo/2018/03/31/19/29/schnitzel-3279045_1280.jpg',
    duration: 60,
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: false,
  ),
  meal(
    id: 'm5',
    categories: [
      'c2'
          'c5',
      'c10',
    ],
    
    affordability: Affordability.Luxurious,
    complexity: Complexity.Simple,
    imageUrl:
        'https://cdn.pixabay.com/photo/2016/10/25/13/29/smoked-salmon-salad-1768890_1280.jpg',
    duration: 15,
    
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: true,
  ),
  meal(
    id: 'm6',
    categories: [
      'c6',
      'c10',
    ],
  
    affordability: Affordability.Affordable,
    complexity: Complexity.Hard,
    imageUrl:
        'https://cdn.pixabay.com/photo/2017/05/01/05/18/pastry-2274750_1280.jpg',
    duration: 240,
  
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: false,
  ),
  meal(
    id: 'm7',
    categories: [
      'c7',
    ],
  
    affordability: Affordability.Affordable,
    complexity: Complexity.Simple,
    imageUrl:
        'https://cdn.pixabay.com/photo/2018/07/10/21/23/pancake-3529653_1280.jpg',
    duration: 20,
  
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: false,
  ),
  meal(
    id: 'm8',
    categories: [
      'c8',
    ],
  
    affordability: Affordability.Pricey,
    complexity: Complexity.Challenging,
    imageUrl:
        'https://cdn.pixabay.com/photo/2018/06/18/16/05/indian-food-3482749_1280.jpg',
    duration: 35,
  
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: true,
  ),
  meal(
    id: 'm9',
    categories: [
      'c9',
    ],
  
    affordability: Affordability.Affordable,
    complexity: Complexity.Hard,
    imageUrl:
        'https://cdn.pixabay.com/photo/2014/08/07/21/07/souffle-412785_1280.jpg',
    duration: 45,
  
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: false,
  ),
  meal(
    id: 'm10',
    categories: [
      'c2',
      'c5',
      'c10',
    ],
  
    affordability: Affordability.Luxurious,
    complexity: Complexity.Simple,
    imageUrl:
        'https://cdn.pixabay.com/photo/2018/04/09/18/26/asparagus-3304997_1280.jpg',
    duration: 30,
  
    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
  ),
];
