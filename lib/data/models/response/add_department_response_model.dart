import 'dart:convert';

import 'department_response_model.dart';

class AddDepartmentResponseModel {
  final String? message;
  final Department? department;

  AddDepartmentResponseModel({
    this.message,
    this.department,
  });

  factory AddDepartmentResponseModel.fromJson(String str) =>
      AddDepartmentResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AddDepartmentResponseModel.fromMap(Map<String, dynamic> json) =>
      AddDepartmentResponseModel(
        message: json["message"],
        department: json["department"] == null
            ? null
            : Department.fromMap(json["department"]),
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "department": department?.toMap(),
      };
}
