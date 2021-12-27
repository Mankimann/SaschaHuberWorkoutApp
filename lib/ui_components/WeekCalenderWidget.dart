import 'package:flutter/material.dart';

class WeekCalenderWidget extends StatelessWidget {
  const WeekCalenderWidget({Key key}) : super(key: key);

  /// Find the first date of the week which contains the provided date.


  @override
  Widget build(BuildContext context) {

    DateTime findFirstDateOfTheWeek(DateTime dateTime) {
      return dateTime.subtract(Duration(days: dateTime.weekday - 1));
    }

    /// Find last date of the week which contains provided date.
    DateTime findLastDateOfTheWeek(DateTime dateTime) {
      return dateTime.add(Duration(days: DateTime.daysPerWeek - dateTime.weekday));
    }



    // var  days = {"Monday", ""} as String;

    return ListView(
      children: [

        Container(
          decoration: const BoxDecoration(
            shape: BoxShape.rectangle

          ),
          child:    Column(
            mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
            textDirection: TextDirection.ltr,
            crossAxisAlignment:  CrossAxisAlignment.baseline,
            children: const [

            ],
          ),
        )
      ],
    );
  }
}
