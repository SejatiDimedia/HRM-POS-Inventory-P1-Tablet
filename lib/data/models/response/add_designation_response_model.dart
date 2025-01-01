import 'dart:convert';

import 'designation_response_model.dart';

class AddDesignationResponseModel {
  final String? message;
  final Designation? designation;

  AddDesignationResponseModel({
    this.message,
    this.designation,
  });

  factory AddDesignationResponseModel.fromJson(String str) =>
      AddDesignationResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AddDesignationResponseModel.fromMap(Map<String, dynamic> json) =>
      AddDesignationResponseModel(
        message: json["message"],
        designation: json["designation"] == null
            ? null
            : Designation.fromMap(json["designation"]),
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "designation": designation?.toMap(),
      };
}
