import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Provider
import '../provider/meal.dart';

// Widget
import '../widget/category_meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var meals = Provider.of<Meals>(context).getFav;
    return Scaffold(
      body: ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
          value: meals[i],
          child: CategoryMealItem(),
        ),
      ),
    );
  }
}
