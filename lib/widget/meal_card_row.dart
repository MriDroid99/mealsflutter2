import 'package:flutter/material.dart';

class MealCardRow extends StatelessWidget {
  final IconData icon;
  final dynamic label;
  const MealCardRow(this.label, this.icon, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        SizedBox(
          width: 5,
        ),
        Text('$label'),
      ],
    );
  }
}
