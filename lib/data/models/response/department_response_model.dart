import 'dart:convert';

class DepartmentResponseModel {
  final String? message;
  final List<Department>? departments;

  DepartmentResponseModel({
    this.message,
    this.departments,
  });

  factory DepartmentResponseModel.fromJson(String str) =>
      DepartmentResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DepartmentResponseModel.fromMap(Map<String, dynamic> json) =>
      DepartmentResponseModel(
        message: json["message"],
        departments: json["departments"] == null
            ? []
            : List<Department>.from(
                json["departments"]!.map((x) => Department.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "departments": departments == null
            ? []
            : List<dynamic>.from(departments!.map((x) => x.toMap())),
      };
}

class Department {
  final int? id;
  final String? departmentName;
  final int? companyId;
  final int? createdBy;
  final String? description;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Department({
    this.id,
    this.departmentName,
    this.companyId,
    this.createdBy,
    this.description,
    this.createdAt,
    this.updatedAt,
  });

  factory Department.fromJson(String str) =>
      Department.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Department.fromMap(Map<String, dynamic> json) => Department(
        id: json["id"],
        departmentName: json["department_name"],
        companyId: json["company_id"],
        createdBy: json["created_by"],
        description: json["description"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "department_name": departmentName,
        "company_id": companyId,
        "created_by": createdBy,
        "description": description,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };

  @override
  String toString() => departmentName!;
}
