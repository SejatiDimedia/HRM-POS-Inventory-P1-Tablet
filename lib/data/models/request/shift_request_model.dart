import 'dart:convert';

class ShiftRequestModel {
  final String? shiftName;
  final String? clockInTime;
  final String? clockOutTime;
  final int? lateMarkAfter;
  final bool? selfClocking;

  ShiftRequestModel({
    this.shiftName,
    this.clockInTime,
    this.clockOutTime,
    this.lateMarkAfter,
    this.selfClocking,
  });

  factory ShiftRequestModel.fromJson(String str) =>
      ShiftRequestModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ShiftRequestModel.fromMap(Map<String, dynamic> json) =>
      ShiftRequestModel(
        shiftName: json["shift_name"],
        clockInTime: json["clock_in_time"],
        clockOutTime: json["clock_out_time"],
        lateMarkAfter: json["late_mark_after"],
        selfClocking: json["self_clocking"],
      );

  Map<String, dynamic> toMap() => {
        "shift_name": shiftName,
        "clock_in_time": clockInTime,
        "clock_out_time": clockOutTime,
        "late_mark_after": lateMarkAfter,
        "self_clocking": selfClocking,
      };
}
