import 'dart:convert';

class DesignationRequestModel {
  final String? designationName;
  final String? description;

  DesignationRequestModel({
    this.designationName,
    this.description,
  });

  factory DesignationRequestModel.fromJson(String str) =>
      DesignationRequestModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DesignationRequestModel.fromMap(Map<String, dynamic> json) =>
      DesignationRequestModel(
        designationName: json["designation_name"],
        description: json["description"],
      );

  Map<String, dynamic> toMap() => {
        "designation_name": designationName,
        "description": description,
      };
}
