import 'dart:convert';

import 'payroll_response_model.dart';

class GeneratePayrollResponseModel {
  final String? message;
  final List<Payroll>? payrolls;

  GeneratePayrollResponseModel({
    this.message,
    this.payrolls,
  });

  factory GeneratePayrollResponseModel.fromJson(String str) =>
      GeneratePayrollResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GeneratePayrollResponseModel.fromMap(Map<String, dynamic> json) =>
      GeneratePayrollResponseModel(
        message: json["message"],
        payrolls: json["payrolls"] == null
            ? []
            : List<Payroll>.from(
                json["payrolls"]!.map((x) => Payroll.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "payrolls": payrolls == null
            ? []
            : List<dynamic>.from(payrolls!.map((x) => x.toMap())),
      };
}
