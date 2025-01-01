import 'dart:convert';

import 'payroll_response_model.dart';

class GetPayrollDetailResponseModel {
  final String? message;
  final Payroll? payroll;

  GetPayrollDetailResponseModel({
    this.message,
    this.payroll,
  });

  factory GetPayrollDetailResponseModel.fromJson(String str) =>
      GetPayrollDetailResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetPayrollDetailResponseModel.fromMap(Map<String, dynamic> json) =>
      GetPayrollDetailResponseModel(
        message: json["message"],
        payroll:
            json["payroll"] == null ? null : Payroll.fromMap(json["payroll"]),
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "payroll": payroll?.toMap(),
      };
}
