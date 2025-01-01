import 'dart:convert';

import 'package:flutter_hrm_inventory_pos_app/data/models/response/leave_reasponse_model.dart';

class AddLeaveResponseModel {
  final String? message;
  final Leave? data;

  AddLeaveResponseModel({
    this.message,
    this.data,
  });

  factory AddLeaveResponseModel.fromJson(String str) =>
      AddLeaveResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AddLeaveResponseModel.fromMap(Map<String, dynamic> json) =>
      AddLeaveResponseModel(
        message: json["message"],
        data: json["data"] == null ? null : Leave.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "data": data?.toMap(),
      };
}
