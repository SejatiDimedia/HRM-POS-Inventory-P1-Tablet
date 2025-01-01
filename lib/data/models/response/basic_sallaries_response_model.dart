import 'dart:convert';

import 'auth_response_model.dart';

class BasicSalariesResponseModel {
  final String? message;
  final List<BasicSalary>? data;

  BasicSalariesResponseModel({
    this.message,
    this.data,
  });

  factory BasicSalariesResponseModel.fromJson(String str) =>
      BasicSalariesResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BasicSalariesResponseModel.fromMap(Map<String, dynamic> json) =>
      BasicSalariesResponseModel(
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<BasicSalary>.from(
                json["data"]!.map((x) => BasicSalary.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class BasicSalary {
  final int? id;
  final int? companyId;
  final int? userId;
  final dynamic basicSalary;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final User? user;

  BasicSalary({
    this.id,
    this.companyId,
    this.userId,
    this.basicSalary,
    this.createdAt,
    this.updatedAt,
    this.user,
  });

  factory BasicSalary.fromJson(String str) =>
      BasicSalary.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BasicSalary.fromMap(Map<String, dynamic> json) => BasicSalary(
        id: json["id"],
        companyId: json["company_id"],
        userId: json["user_id"],
        basicSalary: json["basic_salary"]?.toString(),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        user: json["user"] == null ? null : User.fromMap(json["user"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "company_id": companyId,
        "user_id": userId,
        "basic_salary": basicSalary?.toString(),
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "user": user?.toMap(),
      };
}
