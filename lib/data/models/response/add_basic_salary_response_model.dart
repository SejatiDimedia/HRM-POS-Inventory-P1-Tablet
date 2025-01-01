import 'dart:convert';

import 'package:flutter_hrm_inventory_pos_app/data/models/response/basic_sallaries_response_model.dart';

class AddBasicSalaryResponseModel {
  final String? message;
  final BasicSalary? basicSalary;

  AddBasicSalaryResponseModel({
    this.message,
    this.basicSalary,
  });

  factory AddBasicSalaryResponseModel.fromJson(String str) =>
      AddBasicSalaryResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AddBasicSalaryResponseModel.fromMap(Map<String, dynamic> json) =>
      AddBasicSalaryResponseModel(
        message: json["message"],
        basicSalary:
            json["data"] == null ? null : BasicSalary.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "data": basicSalary?.toMap(),
      };
}
