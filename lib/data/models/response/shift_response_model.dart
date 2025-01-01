import 'dart:convert';

class ShiftResponseModel {
  final String? message;
  final List<Shift>? shifts;

  ShiftResponseModel({
    this.message,
    this.shifts,
  });

  factory ShiftResponseModel.fromJson(String str) =>
      ShiftResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ShiftResponseModel.fromMap(Map<String, dynamic> json) =>
      ShiftResponseModel(
        message: json["message"],
        shifts: json["shifts"] == null
            ? []
            : List<Shift>.from(json["shifts"]!.map((x) => Shift.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "shifts": shifts == null
            ? []
            : List<dynamic>.from(shifts!.map((x) => x.toMap())),
      };
}

class Shift {
  final int? id;
  final int? companyId;
  final String? shiftName;
  final String? clockInTime;
  final String? clockOutTime;
  final int? lateMarkAfter;
  final int? earlyClockInTime;
  final int? allowClockOutTill;
  final bool? selfClocking;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Shift({
    this.id,
    this.companyId,
    this.shiftName,
    this.clockInTime,
    this.clockOutTime,
    this.lateMarkAfter,
    this.earlyClockInTime,
    this.allowClockOutTill,
    this.selfClocking,
    this.createdAt,
    this.updatedAt,
  });

  factory Shift.fromJson(String str) => Shift.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Shift.fromMap(Map<String, dynamic> json) => Shift(
        id: json["id"],
        companyId: json["company_id"],
        shiftName: json["shift_name"],
        clockInTime: json["clock_in_time"],
        clockOutTime: json["clock_out_time"],
        lateMarkAfter: json["late_mark_after"],
        earlyClockInTime: json["early_clock_in_time"],
        allowClockOutTill: json["allow_clock_out_till"],
        selfClocking: json["self_clocking"] == 1,
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
        "shift_name": shiftName,
        "clock_in_time": clockInTime,
        "clock_out_time": clockOutTime,
        "late_mark_after": lateMarkAfter,
        "early_clock_in_time": earlyClockInTime,
        "allow_clock_out_till": allowClockOutTill,
        "self_clocking": selfClocking == true ? 1 : 0,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };

  @override
  String toString() => shiftName!;
}
