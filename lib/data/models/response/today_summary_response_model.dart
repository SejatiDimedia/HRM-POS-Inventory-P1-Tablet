import 'dart:convert';

class TodaySummaryResponseModel {
  final String? message;
  final TodaySummary? data;

  TodaySummaryResponseModel({
    this.message,
    this.data,
  });

  factory TodaySummaryResponseModel.fromJson(String str) =>
      TodaySummaryResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TodaySummaryResponseModel.fromMap(Map<String, dynamic> json) =>
      TodaySummaryResponseModel(
        message: json["message"],
        data: json["data"] == null ? null : TodaySummary.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "data": data?.toMap(),
      };
}

class TodaySummary {
  final int? totalPresent;
  final int? totalLeave;
  final int? totalNotMarked;
  final int? totalAbsent;

  TodaySummary({
    this.totalPresent,
    this.totalLeave,
    this.totalNotMarked,
    this.totalAbsent,
  });

  factory TodaySummary.fromJson(String str) =>
      TodaySummary.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TodaySummary.fromMap(Map<String, dynamic> json) => TodaySummary(
        totalPresent: json["total_present"],
        totalLeave: json["total_leave"],
        totalNotMarked: json["total_not_marked"],
        totalAbsent: json["total_absent"],
      );

  Map<String, dynamic> toMap() => {
        "total_present": totalPresent,
        "total_leave": totalLeave,
        "total_not_marked": totalNotMarked,
        "total_absent": totalAbsent,
      };
}
