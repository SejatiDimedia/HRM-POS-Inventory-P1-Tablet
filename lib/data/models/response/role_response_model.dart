import 'dart:convert';

import 'permission_response_model.dart';

class RoleResponseModel {
  final String? message;
  final List<Role> roles;

  RoleResponseModel({
    this.message,
    this.roles = const [], // Default ke list kosong jika null
  });

  factory RoleResponseModel.fromJson(String str) =>
      RoleResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RoleResponseModel.fromMap(Map<String, dynamic> json) =>
      RoleResponseModel(
        message: json["message"] ?? 'No message', // Nilai default jika null
        roles: json["roles"] == null
            ? []
            : List<Role>.from(json["roles"].map((x) => Role.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "roles": roles.isEmpty
            ? []
            : List<dynamic>.from(roles.map((x) => x.toMap())),
      };
}

class Role {
  final int? id;
  final int? companyId;
  final String? roleName;
  final String? displayName;
  final String? description;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<Permission>? permissions;

  Role({
    this.id,
    this.companyId,
    this.roleName = 'Unknown Role', // Nilai default jika null
    this.displayName = 'Unknown Display Name', // Nilai default
    this.description = 'No description', // Nilai default
    this.createdAt,
    this.updatedAt,
    this.permissions, // Default ke list kosong
  });

  factory Role.fromJson(String str) => Role.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Role.fromMap(Map<String, dynamic> json) => Role(
        id: json["id"],
        companyId: json["company_id"],
        roleName: json["role_name"] ?? 'Unknown Role',
        displayName: json["display_name"] ?? 'Unknown Display Name',
        description: json["description"] ?? 'No description',
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        permissions: json["permissions"] == null
            ? []
            : List<Permission>.from(
                json["permissions"].map((x) => Permission.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "company_id": companyId,
        "role_name": roleName,
        "display_name": displayName,
        "description": description,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "permissions": permissions == null
            ? []
            : List<dynamic>.from(permissions!.map((x) => x.toMap())),
      };

  @override
  String toString() => roleName!;
}

// class Permission {
//   final int? id;
//   final String? name;
//   final String? displayName;
//   final String description;
//   final String? moduleName;
//   final DateTime? createdAt;
//   final DateTime? updatedAt;
//   final Pivot? pivot;

//   Permission({
//     this.id,
//     this.name,
//     this.displayName,
//     this.description = 'No description', // Nilai default jika null
//     this.moduleName,
//     this.createdAt,
//     this.updatedAt,
//     this.pivot,
//   });

//   factory Permission.fromJson(String str) =>
//       Permission.fromMap(json.decode(str));

//   String toJson() => json.encode(toMap());

//   factory Permission.fromMap(Map<String, dynamic> json) => Permission(
//         id: json["id"],
//         name: json["name"] ?? 'Unknown Permission',
//         displayName: json["display_name"] ?? 'Unknown Display Name',
//         description: json["description"] ?? 'No description',
//         moduleName: json["module_name"],
//         createdAt: json["created_at"] == null
//             ? null
//             : DateTime.parse(json["created_at"]),
//         updatedAt: json["updated_at"] == null
//             ? null
//             : DateTime.parse(json["updated_at"]),
//         pivot: json["pivot"] == null ? null : Pivot.fromMap(json["pivot"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "id": id,
//         "name": name,
//         "display_name": displayName,
//         "description": description,
//         "module_name": moduleName,
//         "created_at": createdAt?.toIso8601String(),
//         "updated_at": updatedAt?.toIso8601String(),
//         "pivot": pivot?.toMap(),
//       };
// }

// class Pivot {
//   final int? roleId;
//   final int? permissionId;

//   Pivot({
//     this.roleId,
//     this.permissionId,
//   });

//   factory Pivot.fromJson(String str) => Pivot.fromMap(json.decode(str));

//   String toJson() => json.encode(toMap());

//   factory Pivot.fromMap(Map<String, dynamic> json) => Pivot(
//         roleId: json["role_id"],
//         permissionId: json["permission_id"],
//       );

//   Map<String, dynamic> toMap() => {
//         "role_id": roleId,
//         "permission_id": permissionId,
//       };
// }
