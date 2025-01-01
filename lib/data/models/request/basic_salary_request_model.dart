import 'dart:convert';

class BasicSalaryRequestModel {
  final int? basicSalary;
  final int? userId;

  BasicSalaryRequestModel({
    this.basicSalary,
    this.userId,
  });

  factory BasicSalaryRequestModel.fromJson(String str) =>
      BasicSalaryRequestModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BasicSalaryRequestModel.fromMap(Map<String, dynamic> json) =>
      BasicSalaryRequestModel(
        basicSalary: json["basic_salary"],
        userId: json["user_id"],
      );

  Map<String, dynamic> toMap() => {
        "basic_salary": basicSalary,
        "user_id": userId,
      };
}
