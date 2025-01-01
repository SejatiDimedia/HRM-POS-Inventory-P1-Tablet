import 'dart:convert';

import 'role_response_model.dart';

class EditRolePermissionResponseModel {
  final String? message;
  final Role? role;

  EditRolePermissionResponseModel({
    this.message,
    this.role,
  });

  factory EditRolePermissionResponseModel.fromJson(String str) =>
      EditRolePermissionResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory EditRolePermissionResponseModel.fromMap(Map<String, dynamic> json) =>
      EditRolePermissionResponseModel(
        message: json["message"],
        role: json["role"] == null ? null : Role.fromMap(json["role"]),
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "role": role?.toMap(),
      };
}
