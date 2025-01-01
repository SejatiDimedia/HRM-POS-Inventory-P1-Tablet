import 'dart:convert';

import 'package:flutter_hrm_inventory_pos_app/data/models/response/holidays_response_model.dart';

class EditHolidayResponseModel {
  final String? message;
  final Holiday? data;

  EditHolidayResponseModel({
    this.message,
    this.data,
  });

  factory EditHolidayResponseModel.fromJson(String str) =>
      EditHolidayResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory EditHolidayResponseModel.fromMap(Map<String, dynamic> json) =>
      EditHolidayResponseModel(
        message: json["message"],
        data: json["data"] == null ? null : Holiday.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "data": data?.toMap(),
      };
}
