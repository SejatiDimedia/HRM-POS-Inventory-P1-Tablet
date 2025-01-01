import 'dart:convert';

import 'auth_response_model.dart';

class AttendanceResponseModel {
  final String? message;
  final List<Attendance>? attendance;

  AttendanceResponseModel({
    this.message,
    this.attendance,
  });

  factory AttendanceResponseModel.fromJson(String str) =>
      AttendanceResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AttendanceResponseModel.fromMap(Map<String, dynamic> json) =>
      AttendanceResponseModel(
        message: json["message"],
        attendance: json["data"] == null
            ? []
            : List<Attendance>.from(
                json["data"]!.map((x) => Attendance.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "data": attendance == null
            ? []
            : List<dynamic>.from(attendance!.map((x) => x.toMap())),
      };
}

class Attendance {
  final int? id;
  final int? companyId;
  final DateTime? date;
  final bool? isHoliday;
  final bool? isLeave;
  final int? userId;
  final dynamic leaveId;
  final int? leaveTypeId;
  final int? holidayId;
  final DateTime? clockInDateTime;
  final DateTime? clockOutDateTime;
  final int? totalDuration;
  final bool? isLate;
  final bool? isHalfDay;
  final bool? isPaid;
  //final String? status;
  final Status? status;
  final String? reason;
  final User? user;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Attendance({
    this.id,
    this.companyId,
    this.date,
    this.isHoliday,
    this.isLeave,
    this.userId,
    this.leaveId,
    this.leaveTypeId,
    this.holidayId,
    this.clockInDateTime,
    this.clockOutDateTime,
    this.totalDuration,
    this.isLate,
    this.isHalfDay,
    this.isPaid,
    this.status,
    this.reason,
    this.user,
    this.createdAt,
    this.updatedAt,
  });

  factory Attendance.fromJson(String str) =>
      Attendance.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Attendance.fromMap(Map<String, dynamic> json) => Attendance(
        id: json["id"],
        companyId: json["company_id"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        isHoliday: json["is_holiday"] == 1,
        isLeave: json["is_leave"] == 1,
        userId: json["user_id"],
        leaveId: json["leave_id"],
        leaveTypeId: json["leave_type_id"],
        holidayId: json["holiday_id"],
        clockInDateTime: json["clock_in_date_time"] == null
            ? null
            : DateTime.parse(json["clock_in_date_time"]),
        clockOutDateTime: json["clock_out_date_time"] == null
            ? null
            : DateTime.parse(json["clock_out_date_time"]),
        totalDuration: json["total_duration"],
        isLate: json["is_late"] == 1,
        isHalfDay: json["is_half_day"] == 1,
        isPaid: json["is_paid"] == 1,
        // status: json["status"],
        status: statusValues.map[json["status"]]!,
        reason: json["reason"],
        user: json["user"] == null ? null : User.fromMap(json["user"]),
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
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "is_holiday": isHoliday == true ? 1 : 0,
        "is_leave": isLeave == true ? 1 : 0,
        "user_id": userId,
        "leave_id": leaveId,
        "leave_type_id": leaveTypeId,
        "holiday_id": holidayId,
        "clock_in_date_time": clockInDateTime?.toIso8601String(),
        "clock_out_date_time": clockOutDateTime?.toIso8601String(),
        "total_duration": totalDuration,
        "is_late": isLate == true ? 1 : 0,
        "is_half_day": isHalfDay == true ? 1 : 0,
        "is_paid": isPaid == true ? 1 : 0,
        // "status": status,
        "status": statusValues.reverse[status],
        "reason": reason,
        "user": user?.toMap(),
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

enum Status {
  NOT_MARKED,
  PRESENT,
  ABSENT,
  LEAVE,
}

final statusValues = EnumValues({
  "not marked": Status.NOT_MARKED,
  "present": Status.PRESENT,
  "absent": Status.ABSENT,
  "leave": Status.LEAVE
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
