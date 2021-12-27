import 'package:flutter/material.dart';
import 'package:sascha_huber_workout_app/ui_components/MenuGridWidget.dart';
import 'package:sascha_huber_workout_app/ui_toolbox/constants.dart';

class MainMenuPage extends StatefulWidget {
  const MainMenuPage({Key key}) : super(key: key);

  @override
  _MainMenuState createState() => _MainMenuState();


}

class _MainMenuState extends State<MainMenuPage> {
  @override
  Widget build(BuildContext context) {
   return GridView(
         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
         crossAxisCount: 2,
         mainAxisSpacing: 16,
         crossAxisSpacing: 16,
         childAspectRatio: 1,
         mainAxisExtent: 150,
       ),
       children: [
         MenuGridWidget(color: kLightBackground,
             content: Image.asset("assets/images/banana.png", cacheWidth: 100, cacheHeight:  100), isTapped: () {print("test");},
             text: const Text("Nutrition Tracker", )),

         MenuGridWidget(color: kLightBackground,
             content: Image.asset("assets/images/exercise.png", cacheWidth: 100, cacheHeight:  100),  isTapped: () {},
             text: const Text("Sascha`s Workouts")),

         MenuGridWidget(color: kLightBackground,
             content: Image.asset("assets/images/calendar.png", cacheWidth: 100, cacheHeight:  100),  isTapped: () {},
             text: const Text("Calisthenics - Workouts")),

         MenuGridWidget(color: kLightBackground,
             content: Image.asset("assets/images/heart.png", cacheWidth: 100, cacheHeight:  100),  isTapped: () {},
             text: const Text("Skill Training")),

         MenuGridWidget(color: kLightBackground,
             content: Image.asset("assets/images/workout.png", cacheWidth: 100, cacheHeight:  100),  isTapped: () {},
             text: const Text("Hiit - Workouts")),

         MenuGridWidget(color: kLightBackground,
             content: Image.asset("assets/images/exercise.png", cacheWidth: 100, cacheHeight:  100),  isTapped: () {},
             text: const Text("Dehnübungen")),

         MenuGridWidget(color: kLightBackground,
             content: Image.asset("assets/images/exercise.png", cacheWidth: 100, cacheHeight:  100),  isTapped: () {},
             text: const Text("BMI - Rechner")),

         MenuGridWidget(color: kLightBackground,
             content: Image.asset("assets/images/exercise.png", cacheWidth: 100, cacheHeight:  100),  isTapped: () {},
             text: const Text("Rezepte")),
       ]
   );
  }
}
