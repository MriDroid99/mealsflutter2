import 'package:flutter/material.dart';

// Screen
import '../screen/setteing_screen.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: double.infinity,
              height: 150,
              color: Theme.of(context).primaryColor,
            ),
            Positioned(
              bottom: 10,
              left: 10,
              child: Text(
                'Menu',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
        ListTile(
          onTap: () => Navigator.pushReplacementNamed(context, '/'),
          title: Text(
            'Categories',
            style: TextStyle(fontSize: 20),
          ),
        ),
        Divider(
          thickness: 1.5,
          height: 0,
        ),
        ListTile(
          onTap: () =>
              Navigator.pushReplacementNamed(context, SetteingScreen.routeName),
          title: Text(
            'Settings',
            style: TextStyle(fontSize: 20),
          ),
        )
      ],
    );
  }
}
