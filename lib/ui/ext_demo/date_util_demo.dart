import 'package:flutter/material.dart';
import 'package:widget_utils/extensions/date_time_utils.dart';

class DateUtilDemo extends StatefulWidget {
  const DateUtilDemo({super.key});

  @override
  State<DateUtilDemo> createState() => _DateUtilDemoState();
}

class _DateUtilDemoState extends State<DateUtilDemo> {
  final date = DateTime(1997, 7, 01);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Date Time Extension"),
        backgroundColor: Colors.purple[200],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Date Format-----> ${date.format('yyyy-MM-dd')}"),
            Text("Different Format-----> ${date.newFormat()}"),
            Text(
                "Check same day or not?-----> ${date.isSameDay(DateTime(2023, 5, 28))}"),
            Text("Check today or not?-----> ${date.isToday()}"),
            Text("Check tomorrow or not?-----> ${date.isTomorrow()}"),
            Text("Check yesterday or not?-----> ${date.isYesterday()}"),
            Text("Check future or not?-----> ${date.isFuture()}"),
            Text("Check past or not?-----> ${date.isPast()}"),
            Text("Calculate age-----> ${date.calculateAge()}"),
            Text("Get weekday name-----> ${date.getWeekdayName()}"),
            Text(
                "Check its in this week or not-----> ${date.isWeekend().toString()}"), // Output: true
          ],
        ),
      ),
    );
  }
}
