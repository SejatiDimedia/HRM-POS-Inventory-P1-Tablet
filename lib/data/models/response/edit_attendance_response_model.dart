import 'dart:convert';

import 'package:flutter_hrm_inventory_pos_app/data/models/response/attendance_response_model.dart';

class EditAttendanceResponseModel {
  final String? message;
  final Attendance? data;

  EditAttendanceResponseModel({
    this.message,
    this.data,
  });

  factory EditAttendanceResponseModel.fromJson(String str) =>
      EditAttendanceResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory EditAttendanceResponseModel.fromMap(Map<String, dynamic> json) =>
      EditAttendanceResponseModel(
        message: json["message"],
        data: json["data"] == null ? null : Attendance.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "data": data?.toMap(),
      };
}
