import 'dart:convert';

class PendingLeaveResponseModel {
  final String? message;
  final List<PendingLeave>? data;

  PendingLeaveResponseModel({
    this.message,
    this.data,
  });

  factory PendingLeaveResponseModel.fromJson(String str) =>
      PendingLeaveResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PendingLeaveResponseModel.fromMap(Map<String, dynamic> json) =>
      PendingLeaveResponseModel(
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<PendingLeave>.from(
                json["data"]!.map((x) => PendingLeave.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class PendingLeave {
  final int? id;
  final int? companyId;
  final int? userId;
  final String? userName;
  final String? userPhoto;
  final int? leaveTypeId;
  final String? leaveTypeName;
  final DateTime? startDate;
  final DateTime? endDate;
  final int? totalDays;
  final int? isHalfDay;
  final String? reason;
  final int? isPaid;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  PendingLeave({
    this.id,
    this.companyId,
    this.userId,
    this.userName,
    this.userPhoto,
    this.leaveTypeId,
    this.leaveTypeName,
    this.startDate,
    this.endDate,
    this.totalDays,
    this.isHalfDay,
    this.reason,
    this.isPaid,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory PendingLeave.fromJson(String str) =>
      PendingLeave.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PendingLeave.fromMap(Map<String, dynamic> json) => PendingLeave(
        id: json["id"],
        companyId: json["company_id"],
        userId: json["user_id"],
        userName: json["user_name"],
        userPhoto: json["user_photo"],
        leaveTypeId: json["leave_type_id"],
        leaveTypeName: json["leave_type_name"],
        startDate: json["start_date"] == null
            ? null
            : DateTime.parse(json["start_date"]),
        endDate:
            json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
        totalDays: json["total_days"],
        isHalfDay: json["is_half_day"],
        reason: json["reason"],
        isPaid: json["is_paid"],
        status: json["status"],
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
        "user_name": userName,
        "user_photo": userPhoto,
        "leave_type_id": leaveTypeId,
        "leave_type_name": leaveTypeName,
        "start_date":
            "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
        "end_date":
            "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
        "total_days": totalDays,
        "is_half_day": isHalfDay,
        "reason": reason,
        "is_paid": isPaid,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
