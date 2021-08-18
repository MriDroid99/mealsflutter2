import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Provider
import '../provider/meal.dart';

// Widget
import './meal_card_row.dart';

class CategoryMealItem extends StatefulWidget {
  const CategoryMealItem({Key? key}) : super(key: key);

  @override
  _CategoryMealItemState createState() => _CategoryMealItemState();
}

class _CategoryMealItemState extends State<CategoryMealItem> {
  @override
  Widget build(BuildContext context) {
    var meal = Provider.of<Meal>(context);
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                child: Image.network(meal.imageUrl),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              Positioned(
                bottom: 50,
                right: 0,
                child: Container(
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                    color: Colors.black54,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      meal.title,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MealCardRow('${meal.duration}min', Icons.schedule),
                MealCardRow(
                    '${convertComplexity(meal.complexity)}', Icons.work),
                MealCardRow('${convertAffordability(meal.affordability)}',
                    Icons.attach_money),
                IconButton(
                  onPressed: () {
                    setState(() {
                      if (meal.isFav) {
                        Provider.of<Meals>(context, listen: false)
                            .removeFavMeal(meal.id);
                        meal.isFav = false;
                      } else {
                        Provider.of<Meals>(context, listen: false)
                            .addFavMeal(meal.id);
                        meal.isFav = true;
                      }
                    });
                  },
                  icon: Icon(
                    meal.isFav ? Icons.favorite : Icons.favorite_border,
                    color: Colors.red,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

String convertComplexity(Complexity complexity) {
  switch (complexity) {
    case Complexity.Simple:
      return 'Simple';
    case Complexity.Challenging:
      return 'Challenging';
    default:
      return 'Complex';
  }
}

String convertAffordability(Affordability affordability) {
  switch (affordability) {
    case Affordability.Affordable:
      return 'Affordable';
    case Affordability.Pricey:
      return 'Pricey';
    default:
      return 'Luxurious';
  }
}
