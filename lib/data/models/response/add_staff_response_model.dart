import 'dart:convert';

import 'auth_response_model.dart';

class AddStaffResponseModel {
  final String? message;
  final User? data;

  AddStaffResponseModel({
    this.message,
    this.data,
  });

  factory AddStaffResponseModel.fromJson(String str) =>
      AddStaffResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AddStaffResponseModel.fromMap(Map<String, dynamic> json) =>
      AddStaffResponseModel(
        message: json["message"],
        data: json["data"] == null ? null : User.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "data": data?.toMap(),
      };
}
