import 'dart:convert';

import 'package:flutter_hrm_inventory_pos_app/data/models/response/basic_sallaries_response_model.dart';

class EditBasicSalaryResponseModel {
  final String? message;
  final BasicSalary? basicSalary;

  EditBasicSalaryResponseModel({
    this.message,
    this.basicSalary,
  });

  factory EditBasicSalaryResponseModel.fromJson(String str) =>
      EditBasicSalaryResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory EditBasicSalaryResponseModel.fromMap(Map<String, dynamic> json) =>
      EditBasicSalaryResponseModel(
        message: json["message"],
        basicSalary:
            json["data"] == null ? null : BasicSalary.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "data": basicSalary?.toMap(),
      };
}
