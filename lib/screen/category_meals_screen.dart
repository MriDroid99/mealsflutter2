import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Provider
import '../provider/meal.dart';

// Widget
import '../widget/category_meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category_meals_screen';
  const CategoryMealsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    var meals = Provider.of<Meals>(context)
        .getMeals
        .where(
          (element) => element.categories.contains(
            args['id'],
          ),
        )
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(args['title']!),
      ),
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
