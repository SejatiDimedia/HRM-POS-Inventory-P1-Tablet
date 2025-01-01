import 'dart:convert';

import 'role_response_model.dart';

class AddRoleResponseModel {
  final String? message;
  final Role? role;

  AddRoleResponseModel({
    this.message,
    this.role,
  });

  factory AddRoleResponseModel.fromJson(String str) =>
      AddRoleResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AddRoleResponseModel.fromMap(Map<String, dynamic> json) =>
      AddRoleResponseModel(
        message: json["message"],
        role: json["role"] == null ? null : Role.fromMap(json["role"]),
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "role": role?.toMap(),
      };
}
