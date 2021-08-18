import 'package:flutter/material.dart';

// Model
import '../model/category.dart';

// Widget
import '../widget/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          childAspectRatio: 3 / 2,
        ),
        itemBuilder: (ctx, index) {
          return CategoyItem(
            DUMMY_CATEGORIES[index].id,
            DUMMY_CATEGORIES[index].title,
            DUMMY_CATEGORIES[index].color,
          );
        },
        itemCount: DUMMY_CATEGORIES.length,
      ),
    );
  }
}
