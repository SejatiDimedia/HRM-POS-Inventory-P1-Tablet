import 'dart:convert';

class RolePermissionRequestModel {
  final List<int>? permissions;

  RolePermissionRequestModel({
    this.permissions,
  });

  factory RolePermissionRequestModel.fromJson(String str) =>
      RolePermissionRequestModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RolePermissionRequestModel.fromMap(Map<String, dynamic> json) =>
      RolePermissionRequestModel(
        permissions: json["permissions"] == null
            ? []
            : List<int>.from(json["permissions"]!.map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "permissions": permissions == null
            ? []
            : List<dynamic>.from(permissions!.map((x) => x)),
      };
}
