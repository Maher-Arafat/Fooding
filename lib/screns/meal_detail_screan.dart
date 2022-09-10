// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:provider/provider.dart';

import '../providers/language_provider.dart';
import '../providers/meal_provider.dart';

class MealdetailScrean extends StatefulWidget {
  static const routeName = 'meal_detail';

  @override
  State<MealdetailScrean> createState() => _MealdetailScreanState();
}

class _MealdetailScreanState extends State<MealdetailScrean> {
  Widget buildSctionTitle(BuildContext ctx, String txt) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        txt,
        style: Theme.of(ctx).textTheme.subtitle1,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget buildContainer(Widget child, BuildContext context) {
    bool isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    var dw = MediaQuery.of(context).size.width;
    var dh = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: isLandScape ? (dh * 0.5) : dh * 0.25,
      width: isLandScape ? (dw * 0.5 - 30) : dw,
      child: child,
    );
  }

  String mealId = '';

  void didChangeDependecies() {
    mealId = ModalRoute.of(context)!.settings.arguments as String;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var lan = Provider.of<LanguageProvider>(context, listen: true);
    bool isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final sltmeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    var accentColor = Theme.of(context).colorScheme.secondary;
    List<String> liIngredientLst =
        lan.getTexts('ingredients-$mealId') as List<String>;
    List<String> liStpstLst = lan.getTexts('steps-$mealId') as List<String>;
    var liIngredients = ListView.builder(
      padding: EdgeInsets.all(0),
      itemBuilder: (ctx, idx) => Card(
        color: accentColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Text(
            liIngredientLst[idx],
            style: TextStyle(
                color: useWhiteForeground(accentColor)
                    ? Colors.white
                    : Colors.black),
          ),
        ),
      ),
      itemCount: liIngredientLst.length,
    );
    var liSteps = ListView.builder(
      padding: EdgeInsets.all(0),
      itemBuilder: (ctx, idx) => Column(
        children: [
          ListTile(
            leading: CircleAvatar(child: Text("# ${idx + 1}")),
            title: Text(
              liStpstLst[idx],
              style: TextStyle(color: Colors.black),
            ),
          ),
          Divider(),
        ],
      ),
      itemCount: liStpstLst.length,
    );
    return Directionality(
      textDirection: lan.isEn ? TextDirection.ltr : TextDirection.rtl,
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 300,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(lan.getTexts('meal-$mealId').toString()),
                background: Hero(
                  tag: mealId,
                  child: InteractiveViewer(
                    child: FadeInImage(
                      placeholder: AssetImage('assets/imags/logo2.jpg'),
                      image: NetworkImage(sltmeal.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                if (isLandScape)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          buildSctionTitle(
                              context, lan.getTexts('Ingredients').toString()),
                          buildContainer(liIngredients, context),
                        ],
                      ),
                      Column(
                        children: [
                          buildSctionTitle(
                              context, lan.getTexts('Steps').toString()),
                          buildContainer(liSteps, context),
                        ],
                      ),
                    ],
                  ),
                if (!isLandScape)
                  buildSctionTitle(
                      context, lan.getTexts('Ingredients').toString()),
                if (!isLandScape) buildContainer(liIngredients, context),
                if (!isLandScape)
                  buildSctionTitle(context, lan.getTexts('Steps').toString()),
                if (!isLandScape) buildContainer(liSteps, context),
              ]),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Provider.of<MealProvider>(context, listen: false)
              .toggleFavorite(mealId),
          child: Icon(
            Provider.of<MealProvider>(context, listen: true).isFavorite(mealId)
                ? Icons.star
                : Icons.star_border,
          ),
        ),
      ),
    );
  }
}
