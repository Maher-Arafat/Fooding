// ignore_for_file: camel_case_types, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/language_provider.dart';
import '../screns/category_meal_screan.dart';

class ctgryItm extends StatelessWidget {
  final String id;
  final Color clr;

  const ctgryItm(this.id, this.clr);

  void slctctgry(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(CategogryMealScrean.routeName, arguments: {
      'id': id,
    });
  }

  @override
  Widget build(BuildContext context) {
    var lan = Provider.of<LanguageProvider>(context, listen: true);
    return InkWell(
      onTap: () => slctctgry(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          (lan.getTexts('cat-$id')).toString(),
          style: Theme.of(context).textTheme.subtitle1,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            colors: [
              clr.withOpacity(0.7),
              clr,
            ],
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
