import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Screen
import '../screen/category_meals_screen.dart';

class CategoyItem extends StatelessWidget {
  final id, label;
  final Color color;
  const CategoyItem(this.id, this.label, this.color, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        CategoryMealsScreen.routeName,
        arguments: {
          'id': id,
          'title': label,
        },
      ),
      child: Card(
        color: color,
        child: Center(
          child: Text(
            label,
            style: GoogleFonts.acme(
              textStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
