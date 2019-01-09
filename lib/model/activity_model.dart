import 'package:flutter/material.dart';
import "dart:convert";

class Activities {
  TimeOfDay startTime;
  TimeOfDay endTime;
  String activity;
  String dayName;

  Activities({this.startTime, this.endTime, this.activity, this.dayName});

  String getDayName() {
    return dayName;
  }

  String getActivity() {
    return activity;
  }

  TimeOfDay getStartTime() {
    return startTime;
  }

  TimeOfDay getEndTime() {
    return endTime;
  }

  Activities.fromJson(Map<String, dynamic> json) {
    activity = json['activity'];
    dayName = json['dayName'];

    int hourStart = int.parse(json['start'].toString().split(":")[0]);
    int minStart = int.parse(json['start'].toString().split(":")[1]);

    startTime = TimeOfDay(hour: hourStart, minute: minStart);

    int hourEnd = int.parse(json['end'].toString().split(":")[0]);
    int minEnd = int.parse(json['end'].toString().split(":")[1]);

    endTime = TimeOfDay(hour: hourEnd, minute: minEnd);
  }

  Map<String, dynamic> toJson(Activities activityX) {
    String hourStart = " ";
    String minStart = " ";
    String hourEnd = " ";
    String minEnd = " ";

    hourStart = (activityX.startTime != null ? startTime.hour.toString() : " ");
    minStart = (activityX.startTime != null ? startTime.minute.toString() : " ");
    hourEnd = (activityX.endTime != null ? endTime.hour.toString() : " ");
    minEnd = (activityX.endTime != null ? endTime.minute.toString() : " ");

    String start = "$hourStart:$minStart";
    String end = "$hourEnd:$minEnd";

    Map<String, dynamic> mappedJson = {
      'activity': activityX.activity,
      'dayName': activityX.dayName,
      'start': start,
      'end': end
    };

    String x = JsonEncoder.withIndent("  ").convert(mappedJson);
    return mappedJson;
  }
}
