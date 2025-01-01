import 'dart:convert';

import 'designation_response_model.dart';

class EditDesignationResponseModel {
  final String? message;
  final Designation? designation;

  EditDesignationResponseModel({
    this.message,
    this.designation,
  });

  factory EditDesignationResponseModel.fromJson(String str) =>
      EditDesignationResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory EditDesignationResponseModel.fromMap(Map<String, dynamic> json) =>
      EditDesignationResponseModel(
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
