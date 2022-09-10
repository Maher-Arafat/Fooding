// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:meal_app/providers/meal_provider.dart';

import '../widgts/ctgry_item.dart';

class ctgrisScrean extends StatelessWidget {
  const ctgrisScrean({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        padding: const EdgeInsets.all(25),
        children: Provider.of<MealProvider>(context).availableCategory
            .map(
              (ctData) => ctgryItm(ctData.id, ctData.clr),
            )
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
    );
  }
}
