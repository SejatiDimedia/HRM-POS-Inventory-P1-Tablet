import 'dart:convert';

class GeneratePayrollRequestModel {
  final int? month;
  final int? year;

  GeneratePayrollRequestModel({
    this.month,
    this.year,
  });

  factory GeneratePayrollRequestModel.fromJson(String str) =>
      GeneratePayrollRequestModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GeneratePayrollRequestModel.fromMap(Map<String, dynamic> json) =>
      GeneratePayrollRequestModel(
        month: json["month"],
        year: json["year"],
      );

  Map<String, dynamic> toMap() => {
        "month": month,
        "year": year,
      };
}
