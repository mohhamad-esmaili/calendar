import 'package:flutter/material.dart';

import 'package:flutter_week_view/flutter_week_view.dart';
import 'package:shamsi_date/shamsi_date.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    DateTime date = DateTime(now.year, now.month, now.day);
    DateTime dateTime = DateTime.now();
    Jalali j = Jalali.fromDateTime(dateTime);

    return Scaffold(
      body: SafeArea(
        child: DayView(
          date: j.toDateTime(),
          events: [
            FlutterWeekViewEvent(
              title: 'An event 5',
              description: 'A description 5',
              start: date.add(const Duration(hours: 20)),
              end: date.add(const Duration(hours: 21)),
            ),
          ],
          isRTL: true,
          initialTime: HourMinute(hour: j.hour),
          dayBarStyle: const DayBarStyle(
            color: Colors.white,
            dateFormatter: 
          ),
          currentTimeIndicatorBuilder: ,
          style: DayViewStyle.fromDate(
            date: now,
            currentTimeCircleColor: Colors.pink,
            hourRowHeight: 90,
            currentTimeCirclePosition: CurrentTimeCirclePosition.left,
          ),
          hoursColumnStyle: const HoursColumnStyle(color: Colors.transparent),
        ),
      ),
    );
  }
}
