import 'dart:convert';

import 'package:flutter_hrm_inventory_pos_app/data/models/response/leave_reasponse_model.dart';

class EditLeaveResponseModel {
  final String? message;
  final Leave? data;

  EditLeaveResponseModel({
    this.message,
    this.data,
  });

  factory EditLeaveResponseModel.fromJson(String str) =>
      EditLeaveResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory EditLeaveResponseModel.fromMap(Map<String, dynamic> json) =>
      EditLeaveResponseModel(
        message: json["message"],
        data: json["data"] == null ? null : Leave.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "data": data?.toMap(),
      };
}
