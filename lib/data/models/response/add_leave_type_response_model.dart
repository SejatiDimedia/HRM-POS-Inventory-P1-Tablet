import 'dart:convert';

import 'package:flutter_hrm_inventory_pos_app/data/models/response/leave_type_response_model.dart';

class AddLeaveTypeResponseModel {
  final String? message;
  final LeaveType? data;

  AddLeaveTypeResponseModel({
    this.message,
    this.data,
  });

  factory AddLeaveTypeResponseModel.fromJson(String str) =>
      AddLeaveTypeResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AddLeaveTypeResponseModel.fromMap(Map<String, dynamic> json) =>
      AddLeaveTypeResponseModel(
        message: json["message"],
        data: json["data"] == null ? null : LeaveType.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "data": data?.toMap(),
      };
}
