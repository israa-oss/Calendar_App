import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_clean_calendar/clean_calendar_event.dart';
import 'package:get/get.dart';

class CalendarController extends GetxController {
  DateTime today = DateTime.now();
  late List<CleanCalendarEvent> selectEvent;
  final Map<DateTime, List<CleanCalendarEvent>> events = {
    DateTime(2023, 5, 9): [
      CleanCalendarEvent('Event',
          startTime: DateTime(2023, 5, 9, 10),
          endTime: DateTime(2023, 5, 9, 10),
          description: "Appointment with a refrigerator repair."),
    ],
    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 2):
        [
      CleanCalendarEvent('Event B',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 10, 0),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 12, 0),
          color: Colors.orange),
      CleanCalendarEvent('Event C',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 14, 30),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 17, 0),
          color: Colors.pink),
    ],
  };
  void onDaySelected(selectedDay) {
    today = selectedDay;
    selectEvent = events[today] ?? [];
    update();
  }

  void onInit() {
    selectEvent = events[today] ?? [];
    super.onInit();
  }
  //
  // void onReady() {
  //   selectEvent = events[today] ?? [];
  //   super.onReady();
  // }
}
