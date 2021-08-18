import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Screen
import './screen/category_meals_screen.dart';
import './screen/tab_screen.dart';
import './screen/setteing_screen.dart';

// Provider
import './provider/meal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Meals(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 250, 220, 1),
        ),
        routes: {
          '/': (ctx) => TabScreen(),
          CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),
          SetteingScreen.routeName: (_) => SetteingScreen(),
        },
      ),
    );
  }
}
