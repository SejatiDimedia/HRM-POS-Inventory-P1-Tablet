import 'dart:convert';

class LeaveTypeRequestModel {
  final String? name;
  final bool? isPaid;
  final int? totalLeaves;
  final int? maxLeavesPerMonth;
  final int? createdBy;

  LeaveTypeRequestModel({
    this.name,
    this.isPaid,
    this.totalLeaves,
    this.maxLeavesPerMonth,
    this.createdBy,
  });

  factory LeaveTypeRequestModel.fromJson(String str) =>
      LeaveTypeRequestModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LeaveTypeRequestModel.fromMap(Map<String, dynamic> json) =>
      LeaveTypeRequestModel(
        name: json["name"],
        isPaid: json["is_paid"],
        totalLeaves: json["total_leaves"],
        maxLeavesPerMonth: json["max_leaves_per_month"],
        createdBy: json["created_by"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "is_paid": isPaid,
        "total_leaves": totalLeaves,
        "max_leaves_per_month": maxLeavesPerMonth,
        "created_by": createdBy,
      };
}
