import 'dart:convert';

class DepartmentRequestModel {
  final String? departmentName;
  final String? description;

  DepartmentRequestModel({
    this.departmentName,
    this.description,
  });

  factory DepartmentRequestModel.fromJson(String str) =>
      DepartmentRequestModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DepartmentRequestModel.fromMap(Map<String, dynamic> json) =>
      DepartmentRequestModel(
        departmentName: json["department_name"],
        description: json["description"],
      );

  Map<String, dynamic> toMap() => {
        "department_name": departmentName,
        "description": description,
      };
}
