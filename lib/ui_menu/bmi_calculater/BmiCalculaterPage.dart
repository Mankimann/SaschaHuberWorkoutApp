import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sascha_huber_workout_app/ui_components/BmiSliderWidget.dart';
import 'package:sascha_huber_workout_app/ui_components/RoundButtonWidget.dart';
import 'package:sascha_huber_workout_app/ui_toolbox/constants.dart';

class BmiCalculatorPage extends StatefulWidget {
  const BmiCalculatorPage({Key key}) : super(key: key);

  @override
  State<BmiCalculatorPage> createState() => _BmiCalculatorPageState();
}

class _BmiCalculatorPageState extends State<BmiCalculatorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
              child: Text("BMI Calculator", style: kAppBarTextStyle)),
          primary: true,
          bottomOpacity: 0.01,
          backgroundColor: kAppBarColor,
        ),
        body: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 1,
                mainAxisExtent: 0.001),
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      RoundButtonWidget(
                          color: kAppBarColor,
                          content: const Icon(
                            FontAwesomeIcons.male,
                            size: 64,
                            color: Colors.indigo,
                          ),
                          isTapped: () {},
                          text: const Text("Male")),
                      RoundButtonWidget(
                          color: kAppBarColor,
                          content: const Icon(
                            FontAwesomeIcons.female,
                            size: 64,
                            color: Colors.deepPurple,
                          ),
                          isTapped: () {},
                          text: const Text("Female")),
                    ],
                  ),
                  const BmiSliderWidget(
                      Active_color: kSliderColor_Active,
                      Inactive_COlor: kSliderColor_Inactive,
                      textStart: Text("Alter", style: kUnitTextStyle),
                      textMiddle: Text("14", style: kValueTextStyle),
                      textEnd: Text("Jahre", style: TextStyle(fontSize: 25))),
                  const BmiSliderWidget(
                      Active_color: kSliderColor_Active,
                      Inactive_COlor: kSliderColor_Inactive,
                      textStart: Text("Größe", style: kUnitTextStyle),
                      textMiddle: Text("100", style: kValueTextStyle),
                      textEnd: Text("cm", style: TextStyle(fontSize: 25))),
                  const BmiSliderWidget(
                      Active_color: kSliderColor_Active,
                      Inactive_COlor: kSliderColor_Inactive,
                      textStart: Text("Gewicht", style: kUnitTextStyle),
                      textMiddle: Text("50", style: kValueTextStyle),
                      textEnd: Text("kg", style: TextStyle(fontSize: 25))),
                ],
              ),
            ]));
  }
}
