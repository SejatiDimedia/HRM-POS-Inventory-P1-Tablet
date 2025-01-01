import 'dart:convert';

import 'shift_response_model.dart';

class EditShiftResponseModel {
  final String? message;
  final Shift? shift;

  EditShiftResponseModel({
    this.message,
    this.shift,
  });

  factory EditShiftResponseModel.fromJson(String str) =>
      EditShiftResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory EditShiftResponseModel.fromMap(Map<String, dynamic> json) =>
      EditShiftResponseModel(
        message: json["message"],
        shift: json["shift"] == null ? null : Shift.fromMap(json["shift"]),
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "shift": shift?.toMap(),
      };
}
