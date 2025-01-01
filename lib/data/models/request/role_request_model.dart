import 'dart:convert';

class RoleRequestModel {
  final String? roleName;
  final String? description;

  RoleRequestModel({
    this.roleName,
    this.description,
  });

  factory RoleRequestModel.fromJson(String str) =>
      RoleRequestModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RoleRequestModel.fromMap(Map<String, dynamic> json) =>
      RoleRequestModel(
        roleName: json["role_name"],
        description: json["description"],
      );

  Map<String, dynamic> toMap() => {
        "role_name": roleName,
        "description": description,
      };
}
