import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:sascha_huber_workout_app/ui_menu/bmi_calculater/BmiCalculaterPage.dart';
import 'package:sascha_huber_workout_app/ui_toolbox/constants.dart';

class MenuBar extends StatefulWidget {
  const MenuBar({Key key}) : super(key: key);

  @override
  _MenuBarState createState() => _MenuBarState();
}

class _MenuBarState extends State<MenuBar> {

  int _page = 0;
  int index = 2;

  @override
  Widget build(BuildContext context) {

    DateTime today = DateTime.now();

      final items = <Widget>[
      const Icon(Icons.home, size: 30),
      const Icon(Icons.account_circle_rounded, size: 30),
      const Icon(Icons.search, size: 30),
      const Icon(Icons.badge, size: 30),
      const Icon(Icons.add_shopping_cart_rounded, size: 30),
      const Icon(Icons.settings, size: 30),
    ];

    return CurvedNavigationBar(height: 60, index: index,
        items: items, color: kLightWidgetBackgroundColor,
        backgroundColor: Colors.white,
    onTap: (index) {
      setState(() {
        _page = index;
            if(_page == 2) {
              print ("BMI Calculater \n Hello World");
              print(today);
              Navigator.push(context, MaterialPageRoute(builder: (context)
              => const BmiCalculaterPage()));
            }
        }
        );
    },
    );
  }
}

