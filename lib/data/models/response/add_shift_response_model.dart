import 'dart:convert';

import 'shift_response_model.dart';

class AddShiftResponseModel {
  final String? message;
  final Shift? shift;

  AddShiftResponseModel({
    this.message,
    this.shift,
  });

  factory AddShiftResponseModel.fromJson(String str) =>
      AddShiftResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AddShiftResponseModel.fromMap(Map<String, dynamic> json) =>
      AddShiftResponseModel(
        message: json["message"],
        shift: json["shift"] == null ? null : Shift.fromMap(json["shift"]),
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "shift": shift?.toMap(),
      };
}
