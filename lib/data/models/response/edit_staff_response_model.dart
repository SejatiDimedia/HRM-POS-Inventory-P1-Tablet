import 'dart:convert';

import 'auth_response_model.dart';

class EditStaffResponseModel {
  final String? message;
  final User? data;

  EditStaffResponseModel({
    this.message,
    this.data,
  });

  factory EditStaffResponseModel.fromJson(String str) =>
      EditStaffResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory EditStaffResponseModel.fromMap(Map<String, dynamic> json) =>
      EditStaffResponseModel(
        message: json["message"],
        data: json["data"] == null ? null : User.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "data": data?.toMap(),
      };
}
