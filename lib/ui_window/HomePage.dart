import 'package:flutter/material.dart';
import 'package:sascha_huber_workout_app/ui_menu/mainmenu/MainMenuPage.dart';
import 'package:sascha_huber_workout_app/ui_menu/mainmenu/MenuBar.dart';
import 'package:sascha_huber_workout_app/ui_toolbox/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        title: const Center(
            child: Text("Sascha Huber | Workout App : Menu", style: kAppBarTextStyle)),
          shadowColor: kBackgroundColor,
        elevation: 0,
        centerTitle: true,
      ),
      body: const MainMenuPage(),
      bottomNavigationBar: const MenuBar()
    );
  }
}
