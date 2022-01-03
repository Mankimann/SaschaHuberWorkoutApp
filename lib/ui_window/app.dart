import 'package:flutter/material.dart';
import 'package:sascha_huber_workout_app/ui_menu/bmi_calculater/BmiCalculatorPage.dart';
import 'package:sascha_huber_workout_app/ui_menu/mainmenu/MainMenuPage.dart';
import 'package:sascha_huber_workout_app/ui_toolbox/constants.dart';
import 'package:sascha_huber_workout_app/ui_window/HomePage.dart';


class WorkoutApp extends StatelessWidget {
  const WorkoutApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: kBackgroundColor,
        scaffoldBackgroundColor: kBackgroundColor,
          visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:  const HomePage(),
      initialRoute: '/',
      routes: {
        '/bmi_calculater': (context) => const BmiCalculatorPage(),
        '/menu_page': (context) => const MainMenuPage()
      },


    );
  }

}