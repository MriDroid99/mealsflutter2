import 'package:flutter/material.dart';

// Wigdet
import '../widget/drawer_widget.dart';

class SetteingScreen extends StatelessWidget {
  static const routeName = '/setteing_screen';
  const SetteingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SETTEING'),
      ),
      drawer: Drawer(
        child: DrawerWidget(),
      ),
    );
  }
}
