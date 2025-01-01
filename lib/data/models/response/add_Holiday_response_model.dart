import 'dart:convert';

import 'package:flutter_hrm_inventory_pos_app/data/models/response/holidays_response_model.dart';

class AddHolidayResponseModel {
  final String? message;
  final Holiday? data;

  AddHolidayResponseModel({
    this.message,
    this.data,
  });

  factory AddHolidayResponseModel.fromJson(String str) =>
      AddHolidayResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AddHolidayResponseModel.fromMap(Map<String, dynamic> json) =>
      AddHolidayResponseModel(
        message: json["message"],
        data: json["data"] == null ? null : Holiday.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "data": data?.toMap(),
      };
}
