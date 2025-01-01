import 'dart:convert';

import 'auth_response_model.dart';
import 'leave_type_response_model.dart';

class LeaveResponseModel {
  final String? message;
  final List<Leave>? data;

  LeaveResponseModel({
    this.message,
    this.data,
  });

  factory LeaveResponseModel.fromJson(String str) =>
      LeaveResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LeaveResponseModel.fromMap(Map<String, dynamic> json) =>
      LeaveResponseModel(
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Leave>.from(json["data"]!.map((x) => Leave.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class Leave {
  final int? id;
  final int? companyId;
  final int? userId;
  final int? leaveTypeId;
  final DateTime? startDate;
  final DateTime? endDate;
  final int? totalDays;
  final bool? isHalfDay;
  final String? reason;
  final bool? isPaid;
  final String? status;
  final User? user;
  final LeaveType? leaveType;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Leave({
    this.id,
    this.companyId,
    this.userId,
    this.leaveTypeId,
    this.startDate,
    this.endDate,
    this.totalDays,
    this.isHalfDay,
    this.reason,
    this.isPaid,
    this.status,
    this.user,
    this.leaveType,
    this.createdAt,
    this.updatedAt,
  });

  factory Leave.fromJson(String str) => Leave.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Leave.fromMap(Map<String, dynamic> json) => Leave(
        id: json["id"],
        companyId: json["company_id"],
        userId: json["user_id"],
        leaveTypeId: json["leave_type_id"],
        startDate: json["start_date"] == null
            ? null
            : DateTime.parse(json["start_date"]),
        endDate:
            json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
        totalDays: json["total_days"],
        isHalfDay: json["is_half_day"] == 1,
        reason: json["reason"],
        isPaid: json["is_paid"] == 1,
        status: json["status"],
        user: json["user"] == null ? null : User.fromMap(json["user"]),
        leaveType: json["leave_type"] == null
            ? null
            : LeaveType.fromMap(json["leave_type"]),
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
        "user_id": userId,
        "leave_type_id": leaveTypeId,
        "start_date":
            "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
        "end_date":
            "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
        "total_days": totalDays,
        "is_half_day": isHalfDay == true ? 1 : 0,
        "reason": reason,
        "is_paid": isPaid == true ? 1 : 0,
        "status": status,
        "user": user?.toMap(),
        "leave_type": leaveType?.toMap(),
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
