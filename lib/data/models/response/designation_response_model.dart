import 'dart:convert';

class DesignationResponseModel {
  final String? message;
  final List<Designation>? designations;

  DesignationResponseModel({
    this.message,
    this.designations,
  });

  factory DesignationResponseModel.fromJson(String str) =>
      DesignationResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DesignationResponseModel.fromMap(Map<String, dynamic> json) =>
      DesignationResponseModel(
        message: json["message"],
        designations: json["designations"] == null
            ? []
            : List<Designation>.from(
                json["designations"]!.map((x) => Designation.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "designations": designations == null
            ? []
            : List<dynamic>.from(designations!.map((x) => x.toMap())),
      };
}

class Designation {
  final int? id;
  final String? designationName;
  final int? companyId;
  final int? createdBy;
  final String? description;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Designation({
    this.id,
    this.designationName,
    this.companyId,
    this.createdBy,
    this.description,
    this.createdAt,
    this.updatedAt,
  });

  factory Designation.fromJson(String str) =>
      Designation.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Designation.fromMap(Map<String, dynamic> json) => Designation(
        id: json["id"],
        designationName: json["designation_name"],
        companyId: json["company_id"],
        createdBy: json["created_by"],
        description: json["description"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "designation_name": designationName,
        "company_id": companyId,
        "created_by": createdBy,
        "description": description,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };

  @override
  String toString() => designationName!;
}
