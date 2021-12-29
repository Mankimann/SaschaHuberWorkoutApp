import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
class WeekCalenderWidget extends StatelessWidget {
   WeekCalenderWidget({Key key}) : super(key: key);


  CalendarController controller = CalendarController();

  var arr = new List(7);
  @override
  Widget build(BuildContext context) {
    arr[0] = "Mon";
    arr[1] = "Tue";
    arr[2] = "Wed";
    arr[3] = "Thu";
    arr[4] = "Fri";
    arr[5] = "Sat";
    arr[6] = "Sun";
    return Scaffold(
        body: Center(
          child: TableCalendar(
            calendarController: controller,
            initialCalendarFormat: CalendarFormat.week,
            headerVisible: false,
            builders: CalendarBuilders(
              // week days
              dowWeekdayBuilder: (context, weekday) {
                return Container();
              },
              // dates
              dayBuilder: (context, date, events) {
                return Container(
                  //  color: Colors.green,
                  margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(6)),
                      border: Border.all(color: const Color(0xffd6edff), width: 1)),

                  child: Column(
                    children: [
                      _showDate(date),
                      _showWeek(date),
                    ],
                  ),

                  // ),
                  // )),
                );
                //);
              },
            ),
          ),
        ));
  }

  Widget _showDate(DateTime date) {
    return Container(
        padding: const EdgeInsets.all(2), child: Text(arr[date.weekday - 1]));
  }

  Widget _showWeek(DateTime date) {
    return Container(padding: const EdgeInsets.all(2), child: Text('${date.day}'));
  }
}
