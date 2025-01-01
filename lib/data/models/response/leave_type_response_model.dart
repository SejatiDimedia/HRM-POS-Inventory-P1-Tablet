import 'dart:convert';

class LeaveTypesResponseModel {
  final String? message;
  final List<LeaveType>? data;

  LeaveTypesResponseModel({
    this.message,
    this.data,
  });

  factory LeaveTypesResponseModel.fromJson(String str) =>
      LeaveTypesResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LeaveTypesResponseModel.fromMap(Map<String, dynamic> json) =>
      LeaveTypesResponseModel(
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<LeaveType>.from(
                json["data"]!.map((x) => LeaveType.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class LeaveType {
  final int? id;
  final int? companyId;
  final String? name;
  final int? isPaid;
  final int? totalLeaves;
  final int? maxLeavesPerMonth;
  final int? createdBy;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  LeaveType({
    this.id,
    this.companyId,
    this.name,
    this.isPaid,
    this.totalLeaves,
    this.maxLeavesPerMonth,
    this.createdBy,
    this.createdAt,
    this.updatedAt,
  });

  factory LeaveType.fromJson(String str) => LeaveType.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LeaveType.fromMap(Map<String, dynamic> json) => LeaveType(
        id: json["id"],
        companyId: json["company_id"],
        name: json["name"],
        isPaid: json["is_paid"],
        totalLeaves: json["total_leaves"],
        maxLeavesPerMonth: json["max_leaves_per_month"],
        createdBy: json["created_by"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "company_id": companyId,
        "name": name,
        "is_paid": isPaid,
        "total_leaves": totalLeaves,
        "max_leaves_per_month": maxLeavesPerMonth,
        "created_by": createdBy,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };

  @override
  String toString() => name!;
}
