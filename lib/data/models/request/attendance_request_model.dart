import 'dart:convert';

class AttendanceRequestModel {
  final DateTime? date;
  final bool? isHoliday;
  final bool? isLeave;
  final int? userId;
  final int? leaveId;
  final int? leaveTypeId;
  final int? holidayId;
  final String? clockInDateTime;
  final String? clockOutDateTime;
  final int? totalDuration;
  final bool? isLate;
  final bool? isHalfDay;
  final bool? isPaid;
  final String? status;
  final String? reason;

  AttendanceRequestModel({
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
  });

  factory AttendanceRequestModel.fromJson(String str) =>
      AttendanceRequestModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AttendanceRequestModel.fromMap(Map<String, dynamic> json) =>
      AttendanceRequestModel(
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        isHoliday: json["is_holiday"],
        isLeave: json["is_leave"],
        userId: json["user_id"],
        leaveId: json["leave_id"],
        leaveTypeId: json["leave_type_id"],
        holidayId: json["holiday_id"],
        // clockInDateTime: json["clock_in_date_time"] == null
        //     ? null
        //     : DateTime.parse(json["clock_in_date_time"]),
        // clockOutDateTime: json["clock_out_date_time"] == null
        //     ? null
        //     : DateTime.parse(json["clock_out_date_time"]),
        clockInDateTime: json["clock_in_date_time"],
        clockOutDateTime: json["clock_out_date_time"],
        totalDuration: json["total_duration"],
        isLate: json["is_late"],
        isHalfDay: json["is_half_day"],
        isPaid: json["is_paid"],
        status: json["status"],
        reason: json["reason"],
      );

  Map<String, dynamic> toMap() => {
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "is_holiday": isHoliday,
        "is_leave": isLeave,
        "user_id": userId,
        "leave_id": leaveId,
        "leave_type_id": leaveTypeId,
        "holiday_id": holidayId,
        "clock_in_date_time": clockInDateTime,
        "clock_out_date_time": clockOutDateTime,
        "total_duration": totalDuration,
        "is_late": isLate,
        "is_half_day": isHalfDay,
        "is_paid": isPaid,
        "status": status,
        "reason": reason,
      };
}
