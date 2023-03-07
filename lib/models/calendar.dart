import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'calendar.g.dart';

@JsonSerializable()
class Calendar {
  double latitude;
  double longitude;
  String address;
  DateTime timeOpen;
  DateTime timeClose;

  Calendar({
    required this.latitude,
    required this.longitude,
    required this.address,
    required this.timeOpen,
    required this.timeClose,
  });

  factory Calendar.fromJson(Map<String, dynamic> json) => _$CalendarFromJson(json);

  Map<String, dynamic> toJson() => _$CalendarToJson(this);

  TimeOfDay getTime(DateTime dateTime) {
    return TimeOfDay.fromDateTime(dateTime);
  }
}