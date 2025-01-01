import 'dart:convert';

import 'package:flutter_hrm_inventory_pos_app/data/models/response/attendance_response_model.dart';

class AddAttendanceResponseModel {
  final String? message;
  final Attendance? data;

  AddAttendanceResponseModel({
    this.message,
    this.data,
  });

  factory AddAttendanceResponseModel.fromJson(String str) =>
      AddAttendanceResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AddAttendanceResponseModel.fromMap(Map<String, dynamic> json) =>
      AddAttendanceResponseModel(
        message: json["message"],
        data: json["data"] == null ? null : Attendance.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "data": data?.toMap(),
      };
}
