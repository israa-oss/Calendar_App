import 'package:flutter/material.dart';
import 'package:flutter_clean_calendar/flutter_clean_calendar.dart';
import 'package:get/get.dart';

import 'calender_controller.dart';

// DateTime today = DateTime.now();

class CalendarPage extends GetView<CalendarController> {
  CalendarController controller = Get.put(CalendarController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar'),
      ),
      body: GetBuilder<CalendarController>(
        init: CalendarController(),
        builder: (c) => Content(),
      ),
    );
  }

  Widget Content() {
    return SafeArea(
      //     child: TableCalendar(
      //   onDaySelected: controller.onDaySelected,
      //   locale: "en_US",
      //   availableGestures: AvailableGestures.all,
      //   headerStyle: HeaderStyle(
      //     formatButtonVisible: false,
      //     titleCentered: true,
      //   ),
      //   focusedDay: controller.today,
      //   firstDay: DateTime.utc(2010, 1, 1),
      //   lastDay: DateTime.utc(2030, 12, 30),
      //   selectedDayPredicate: (selectedDay) =>
      //       isSameDay(selectedDay, controller.today),
      // )

      child: Calendar(
        startOnMonday: true,
        selectedColor: Colors.deepPurple,
        todayColor: Colors.green,
        eventColor: Colors.blue,
        eventDoneColor: Colors.red,
        bottomBarColor: Colors.blueGrey,
        onRangeSelected: (range) {
          print('select Day:${range.from},${range.to}');
        },
        onDateSelected: (data) {
          return controller.onDaySelected(data);
        },
        events: controller.events,
        isExpandable: true,
        dayOfWeekStyle: TextStyle(
          fontSize: 16,
          color: Colors.black,
        ),
        bottomBarTextStyle: TextStyle(color: Colors.blue),
        hideBottomBar: false,
        hideArrows: false,
        weekDays: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
      ),
    );
  }
}
