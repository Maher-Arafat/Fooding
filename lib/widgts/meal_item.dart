// ignore_for_file: use_key_in_widget_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:meal_app/screns/meal_detail_screan.dart';
import 'package:provider/provider.dart';

import '../moduls/meal.dart';
import '../providers/language_provider.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  const MealItem({
    required this.id,
    required this.imageUrl,
    required this.duration,
    required this.complexity,
    required this.affordability,
  });
  void slcMeal(BuildContext ctx) {
    Navigator.of(ctx)
        .pushNamed(
          MealdetailScrean.routeName,
          arguments: id,
        )
        .then((rslt) {});
  }

  @override
  Widget build(BuildContext context) {
    var lan = Provider.of<LanguageProvider>(context, listen: true);
    return InkWell(
      onTap: () => slcMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  ClipRRect(  
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    child: Hero(
                      tag: id,
                      child: InteractiveViewer(
                        child: FadeInImage(
                           width: double.infinity,
                          placeholder: const AssetImage('assets/imags/logo2.jpg'),
                          image: NetworkImage(imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    right: 10,
                    child: Container(
                      width: 300,
                      color: Colors.black54,
                      padding:
                          const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                      child: Text(
                        lan.getTexts('meal-$id').toString(),
                        style: const TextStyle(fontSize: 25, color: Colors.white),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule,
                          color: Theme.of(context).splashColor),
                      const SizedBox(width: 6),
                      if (duration <= 10)
                        Text("$duration " + lan.getTexts("min2").toString()),
                      if (duration > 10)
                        Text("$duration " + lan.getTexts("min").toString()),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work, color: Theme.of(context).splashColor),
                      const SizedBox(width: 6),
                      Text(lan.getTexts('$complexity').toString()),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money,
                          color: Theme.of(context).splashColor),
                      Text(lan.getTexts('$affordability').toString()),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
