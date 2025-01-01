import 'dart:convert';

class TodayAttendanceResponseModel {
  final String? message;
  final List<TodayAttendance>? data;

  TodayAttendanceResponseModel({
    this.message,
    this.data,
  });

  factory TodayAttendanceResponseModel.fromJson(String str) =>
      TodayAttendanceResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TodayAttendanceResponseModel.fromMap(Map<String, dynamic> json) =>
      TodayAttendanceResponseModel(
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<TodayAttendance>.from(
                json["data"]!.map((x) => TodayAttendance.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class TodayAttendance {
  final int? id;
  final String? userName;
  final DateTime? date;
  final DateTime? clockInDateTime;
  final DateTime? clockOutDateTime;
  final String? status;
  final String? image;

  TodayAttendance({
    this.id,
    this.userName,
    this.date,
    this.clockInDateTime,
    this.clockOutDateTime,
    this.status,
    this.image,
  });

  factory TodayAttendance.fromJson(String str) =>
      TodayAttendance.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TodayAttendance.fromMap(Map<String, dynamic> json) => TodayAttendance(
        id: json["id"],
        userName: json["user_name"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        clockInDateTime: json["clock_in_date_time"] == null
            ? null
            : DateTime.parse(json["clock_in_date_time"]),
        clockOutDateTime: json["clock_out_date_time"] == null
            ? null
            : DateTime.parse(json["clock_out_date_time"]),
        status: json["status"],
        image: json["image"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "user_name": userName,
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "clock_in_date_time": clockInDateTime?.toIso8601String(),
        "clock_out_date_time": clockOutDateTime?.toIso8601String(),
        "status": status,
        "image": image,
      };
}
