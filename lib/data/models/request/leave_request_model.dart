import 'dart:convert';

class LeaveRequestModel {
  final int? userId;
  final int? leaveTypeId;
  final DateTime? startDate;
  final DateTime? endDate;
  final int? totalDays;
  final bool? isHalfDay;
  final String? reason;
  final bool? isPaid;
  final String? status;

  LeaveRequestModel({
    this.userId,
    this.leaveTypeId,
    this.startDate,
    this.endDate,
    this.totalDays,
    this.isHalfDay,
    this.reason,
    this.isPaid,
    this.status,
  });

  factory LeaveRequestModel.fromJson(String str) =>
      LeaveRequestModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LeaveRequestModel.fromMap(Map<String, dynamic> json) =>
      LeaveRequestModel(
        userId: json["user_id"],
        leaveTypeId: json["leave_type_id"],
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
      );

  Map<String, dynamic> toMap() => {
        "user_id": userId,
        "leave_type_id": leaveTypeId,
        "start_date":
            "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
        "end_date":
            "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
        "total_days": totalDays,
        "is_half_day": isHalfDay,
        "reason": reason,
        "is_paid": isPaid,
        "status": status,
      };
}
