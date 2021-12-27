import 'package:flutter/material.dart';

class WeekCalenderWidget extends StatelessWidget {
  const WeekCalenderWidget({Key key}) : super(key: key);




  @override
  Widget build(BuildContext context) {

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
