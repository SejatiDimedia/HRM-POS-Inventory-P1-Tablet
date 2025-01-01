import 'dart:convert';

import 'package:flutter_hrm_inventory_pos_app/data/models/response/leave_type_response_model.dart';

class EditLeaveTypeResponseModel {
  final String? message;
  final LeaveType? data;

  EditLeaveTypeResponseModel({
    this.message,
    this.data,
  });

  factory EditLeaveTypeResponseModel.fromJson(String str) =>
      EditLeaveTypeResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory EditLeaveTypeResponseModel.fromMap(Map<String, dynamic> json) =>
      EditLeaveTypeResponseModel(
        message: json["message"],
        data: json["data"] == null ? null : LeaveType.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "data": data?.toMap(),
      };
}
