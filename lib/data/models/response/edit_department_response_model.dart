import 'dart:convert';

import 'department_response_model.dart';

class EditDepartmentResponseModel {
  final String? message;
  final Department? department;

  EditDepartmentResponseModel({
    this.message,
    this.department,
  });

  factory EditDepartmentResponseModel.fromJson(String str) =>
      EditDepartmentResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory EditDepartmentResponseModel.fromMap(Map<String, dynamic> json) =>
      EditDepartmentResponseModel(
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
