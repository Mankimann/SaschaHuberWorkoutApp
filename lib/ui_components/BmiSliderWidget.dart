import 'package:flutter/material.dart';
import 'package:sascha_huber_workout_app/ui_toolbox/constants.dart';

class BmiSliderWidget extends StatelessWidget {
  const BmiSliderWidget({Key key,  this.Active_color,  this.Inactive_COlor,  this.textStart,  this.textMiddle,  this.textEnd}) : super(key: key);


  final Color Active_color;
  final Color Inactive_COlor;
  final Text textStart;
  final Text textMiddle;
  final Text textEnd;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(15),
      child: Column(
        children: [


           Padding(padding: const EdgeInsets.all(15.0),
          child: Container(
          child:  Column(
            children: [

              Row(
                children: [

                  textStart,

                  const SizedBox(
                    width: 80,
                  ),
                  textMiddle,
                  const SizedBox(
                    width: 8,
                  ),
                  textEnd
                ],
              ),
              Slider(value: 100, onChanged: (value) {

              },
                  activeColor: Active_color,
                  inactiveColor: Colors.tealAccent,
                  min: kSliderValueMin, max: kSliderValueMax),
            ],
          ),
            decoration:  BoxDecoration(
              color: kLightWidgetBackgroundColor,
              borderRadius: BorderRadius.circular(12.0)),
            ),
          ),
      ],
      )
    );
  }
}


