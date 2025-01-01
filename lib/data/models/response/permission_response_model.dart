import 'dart:convert';

class PermissionResponseModel {
  final String? message;
  final List<Permission>? permissions;

  PermissionResponseModel({
    this.message,
    this.permissions,
  });

  factory PermissionResponseModel.fromJson(String str) =>
      PermissionResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PermissionResponseModel.fromMap(Map<String, dynamic> json) =>
      PermissionResponseModel(
        message: json["message"],
        permissions: json["permissions"] == null
            ? []
            : List<Permission>.from(
                json["permissions"]!.map((x) => Permission.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "permissions": permissions == null
            ? []
            : List<dynamic>.from(permissions!.map((x) => x.toMap())),
      };
}

class Permission {
  final int? id;
  final String? name;
  final String? displayName;
  final String description;
  final String? moduleName;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Pivot? pivot;

  Permission({
    this.id,
    this.name,
    this.displayName,
    this.description = 'No description', // Nilai default jika null
    this.moduleName,
    this.createdAt,
    this.updatedAt,
    this.pivot,
  });

  factory Permission.fromJson(String str) =>
      Permission.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Permission.fromMap(Map<String, dynamic> json) => Permission(
        id: json["id"],
        name: json["name"] ?? 'Unknown Permission',
        displayName: json["display_name"] ?? 'Unknown Display Name',
        description: json["description"] ?? 'No description',
        moduleName: json["module_name"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        pivot: json["pivot"] == null ? null : Pivot.fromMap(json["pivot"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "display_name": displayName,
        "description": description,
        "module_name": moduleName,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "pivot": pivot?.toMap(),
      };
}

class Pivot {
  final int? roleId;
  final int? permissionId;

  Pivot({
    this.roleId,
    this.permissionId,
  });

  factory Pivot.fromJson(String str) => Pivot.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Pivot.fromMap(Map<String, dynamic> json) => Pivot(
        roleId: json["role_id"],
        permissionId: json["permission_id"],
      );

  Map<String, dynamic> toMap() => {
        "role_id": roleId,
        "permission_id": permissionId,
      };
}
