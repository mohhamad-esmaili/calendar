import 'package:calendar/screens/event_screen.dart';
import 'package:flutter/material.dart';

import 'package:flutter_week_view/flutter_week_view.dart';
import 'package:shamsi_date/shamsi_date.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';
  const HomeScreen({Key? key}) : super(key: key);
  String _timePostfix(int income) {
    if (income <= 11) {
      return "ق.ظ";
    } else if (income > 11 && income < 12) {
      return "ظ";
    } else if (income > 12 && income < 18) {
      return "ب.ظ";
    } else {
      return "شب";
    }
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    DateTime date = DateTime(now.year, now.month, now.day);
    DateTime dateTime = DateTime.now();
    Jalali j = Jalali.fromDateTime(dateTime);

    List dayWeek = [
      "شنبه",
      "یکشنبه",
      "دوشنبه",
      "سه‌شنبه",
      "چهارشنبه",
      "پنج‌شنبه",
      "جمعه",
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text("${dayWeek[j.weekDay - 1]} ${j.year}/${j.month}/${j.day} "),
      ),
      body: SafeArea(
        child: DayView(
          onHoursColumnTappedDown: (date) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => EventScreen(),
            ));
            print(date);
          },
          date: now,
          isRTL: true,
          initialTime: HourMinute(hour: j.hour, minute: j.minute),

          dayBarStyle: DayBarStyle(
            color: Colors.white,
            dateFormatter: (y, m, d) {
              return '';
            },
          ),
          hoursColumnStyle: HoursColumnStyle(
            textAlignment: Alignment.center,
            width: 100,
            timeFormatter: (time) {
              return "${time.hour}:00 ${_timePostfix(time.hour)}";
            },
          ),
          // currentTimeIndicatorBuilder: (dayViewStyle, f, d, b) {
          //   return Positioned(
          //     top: b ? 60 * 2 : now.hour.toDouble() * 2,
          //     right: 0,
          //     child: Row(
          //       children: [
          //         Container(
          //           padding: const EdgeInsets.symmetric(horizontal: 10),
          //           width: 100,
          //           alignment: Alignment.center,
          //           decoration: BoxDecoration(
          //             color: Colors.white,
          //             border: Border.all(
          //               color: const Color.fromRGBO(67, 97, 238, 1),
          //             ),
          //             borderRadius: BorderRadius.circular(10),
          //           ),
          //           child:
          //               Text('${DateTime.now().hour}:${DateTime.now().minute}'),
          //         ),
          //         Container(
          //           width: MediaQuery.of(context).size.width,
          //           height: 2,
          //           color: const Color.fromRGBO(67, 97, 238, 1),
          //         )
          //       ],
          //     ),
          //   );
          // },
          style: DayViewStyle.fromDate(
            date: now,
            backgroundRulesColor: Colors.grey,
            currentTimeRuleColor: const Color.fromRGBO(67, 97, 238, 1),
            headerSize: 0,
            currentTimeCirclePosition: CurrentTimeCirclePosition.left,
          ),
        ),
      ),
    );
  }
}
